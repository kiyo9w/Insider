# PROJECT DESIGN DOCUMENT: RESCUE ROVER

**Version:** 1.0.0
**Status:** Approved for Execution
**Architecture:** Hybrid Connected/Autonomous Edge Node

## 1\. System Overview & Operational Logic

The Rescue Rover is a distributed IoT system designed for high-latency, connection denied environments. It does not rely on continuous connectivity. Instead, it utilizes a "Store-and-Forward" architecture with a local Finite State Machine (FSM) governing behavior based on signal integrity.

### 1.1. Operational Modes

The system operates in two mutually exclusive modes triggered by a "Heartbeat" mechanism.

#### Mode A: Connected (The Scout)

  * **Trigger:** Heartbeat packet received from Gateway within the last 2000ms.
  * **Video Feed:** 160x120 (QQVGA) MJPEG stream transmitted via ESP-NOW Broadcast (No-ACK).
  * **Control Loop:**
    1.  **Telemetry:** Robot transmits video/sensor data to Laptop.
    2.  **Inference (Host):** Laptop samples video frame (0.5 Hz). LLM/Vision model analyzes scene.
    3.  **Command:** Laptop sends JSON-derived control packet (e.g., `MOVE_FORWARD`, `STOP_AND_CAPTURE`).
  * **Detection Event:** If onboard TFLite detects a human:
    1.  Robot halts.
    2.  Captures High-Res (SVGA) image.
    3.  Transmits via Reliable Protocol (ACK required).

#### Mode B: Disconnected (The Survivor)

  * **Trigger:** Heartbeat timeout (\> 2000ms silence).
  * **Navigation:** Autonomous Reactive Avoidance (Ultrasonic Sensor). Logic: `If distance < 25cm: Stop -> Reverse -> Turn Randomly`.
  * **Data Preservation:**
      * Video stream is disabled to save power/CPU.
      * TFLite runs on a timer (e.g., every 2 seconds).
      * **Positive Detection:** Image is written to SD Card (`/evidence/log_X.jpg`).
  * **Recovery:** Upon reconnection, Robot sends a "Manifest" (list of files). Laptop requests file download.

-----

## 2\. Hardware Architecture & Electrical Safety

**Critical Warning:** The ESP32-CAM is extremely sensitive to voltage fluctuations. The following electrical standards are mandatory. Failure to adhere will result in "Brownout Reset" loops.

### 2.1. Power Distribution Network (PDN)

  * **Source:** 2x 18650 Li-Ion Batteries (Series = 7.4V Nominal).
  * **Logic Rail (5V):**
      * **Regulator:** LM2596 Buck Converter (Step-Down).
      * **Input:** 7.4V from Battery.
      * **Output:** Tuned to 5.1V -\> Connected to ESP32-CAM 5V / GND.
      * **Filtering:** 470uF Electrolytic Capacitor soldered directly to ESP32-CAM 5V/GND pins.
  * **Drive Rail (12V/Motor Power):**
      * **Connection:** Direct from Battery to L298N 12V Input.
      * **Grounding:** **Common Ground** is required. Battery(-), Buck(-), L298N(-), and ESP32(-) must share a physical connection.

### 2.2. GPIO Pin Map (Conflict Resolution)

The ESP32-CAM has limited pins. We utilize **1-Bit SD Mode** to free up pins for motors.

| Component | ESP32 Pin | Logic Note |
| :--- | :--- | :--- |
| **Motor Left A** | GPIO 12 | Requires SD Card set to 1-Bit Mode |
| **Motor Left B** | GPIO 13 | Requires SD Card set to 1-Bit Mode |
| **Motor Right A** | GPIO 14 | Shared with SD CLK (Must test for interference) |
| **Motor Right B** | GPIO 15 | Shared with SD CMD (Must test for interference) |
| **Ultrasonic Trig** | GPIO 3 | RX Pin (Serial unavailable after boot) |
| **Ultrasonic Echo** | GPIO 1 | TX Pin (Serial unavailable after boot) |
| **SD Card** | Slot | **MUST initialize with `SD_MMC.begin("/sdcard", true)` (1-bit mode)** |

*Note: If Motor/SD conflict persists, shift motors to an I2C Port Expander (PCF8574) on pins 1 and 3.*

-----

## 3\. Communication Protocol (The Courier Layer)

**Protocol Type:** ESP-NOW (Connectionless, Peer-to-Peer).
**MAC Address:** Hardcoded peer MAC addresses for security and speed.

### 3.1. Packet Structure

To handle fragmentation (max payload \~250 bytes), all transmissions use this packed struct:

```cpp
typedef struct __attribute__((packed)) {
    uint8_t msg_type;       // 0: HEARTBEAT, 1: STREAM_IMG (No-ACK), 2: HD_IMG (ACK), 3: CMD
    uint16_t sequence_id;   // Rolling counter to detect packet loss
    uint16_t chunk_id;      // Current chunk index (0 to N)
    uint16_t total_chunks;  // Total chunks in this frame
    uint16_t payload_len;   // Actual data length in this packet
    uint8_t payload[230];   // Max buffer size
} rover_packet_t;
```

### 3.2. Transmission Logic

  * **Stream (Type 1):** Sent with `esp_now_send()`. Callback is ignored. High throughput, low reliability.
  * **Evidence (Type 2):** Sent with Stop-and-Wait ARQ. Sender waits for specific ACK packet from Receiver before sending the next chunk.

-----

## 4\. Role Assignments & Deliverables

### 🟢 Member 1: The Architect (Firmware & HAL)

**Scope:** Hardware Abstraction Layer, Electrical Assembly, Real-Time Operating System (RTOS) Loop.

  * **Primary Tasks:**

    1.  **Power Rig:** Assemble Battery -\> Buck Converter -\> ESP32 wiring harness.
    2.  **Motor Driver:** Implement PWM logic using `ledcWrite` (Arduino ESP32 v2) or `ledc` API (v3). Calibrate "Turn 90 Degrees" timing.
    3.  **FSM Implementation:** Code the switch statement managing `STATE_CONNECTED` vs `STATE_AUTONOMOUS`.
    4.  **Pin Management:** Implement the 1-Bit SD Card initialization to ensure Motor pins 12/13 are available.

  * **Definition of Done (DoD):**

      * Robot drives in a square pattern powered by battery (no USB).
      * Unplugging the Receiver ESP32 causes the robot to immediately switch to Obstacle Avoidance behavior.

### 🔵 Member 2: The Courier (Network Engineer)

**Scope:** Data Link Layer, Python Gateway.

  * **Primary Tasks:**

    1.  **Fragmentation Engine:** Write C++ function to slice a `camera_fb_t` buffer into 230-byte payloads.
    2.  **Python Reassembler:** Write a Python script (using `pyserial`) to read hex data from the Gateway Node and reconstruct JPEG files.
    3.  **Flow Control:** Tune the `delayMicroseconds()` between packets to prevent receiver buffer overflow.

  * **Definition of Done (DoD):**

      * System achieves \> 8 FPS video stream at 160x120 resolution.
      * Reconstructed images have no visual artifacts (glitch lines).

### 🟣 Member 3: The Eye (Edge AI Specialist)

**Scope:** TFLite Model, Camera Sensors.

  * **Primary Tasks:**

    1.  **Model Quantization:** Convert the standard MobileNet SSD model to `int8` format to fit in ESP32-CAM RAM.
    2.  **Resolution Switching:** Implement logic to change sensor config from `FRAMESIZE_QQVGA` (Stream) to `FRAMESIZE_SVGA` (Capture) on the fly.
    3.  **Interleaved Inference:** Ensure `tflite.invoke()` is called only every Nth frame or via a separate FreeRTOS task to avoid blocking the video stream.

  * **Definition of Done (DoD):**

      * TFLite detection runs without triggering a Watchdog Timer (WDT) reset.
      * Detection logic ignores static objects (chairs) but triggers on humans with \> 70% confidence.

### 🟠 Member 4: The Commander (Integration & UX)

**Scope:** Host Application, LLM Integration.

  * **Primary Tasks:**

    1.  **Dashboard:** Create a Streamlit interface. Left Column: Live Video. Right Column: Mission Log / Telemetry.
    2.  **LLM Bridge:** Implement a Python thread that samples the video buffer, sends the image to Ollama/Gemini API, and parses the JSON response.
    3.  **Sync Logic:** Implement the "Fetch Evidence" button that requests SD card file transmission.

  * **Definition of Done (DoD):**

      * Dashboard displays live video with \< 500ms latency.
      * LLM provides textual navigation commands ("Obstacle Left, Turn Right") based on the video feed.

-----

## 5\. Execution Roadmap (Parallel Warfare)

### Week 1: Isolation & Simulation

  * **Architect:** Build Chassis & Power Rig. Prove Motor control works with SD Card initialized.
  * **Courier:** Build "Ping-Pong" firmware. Send dummy data arrays between two ESP32s. Measure throughput.
  * **Eye:** Run "Person Detection" on ESP32-CAM using static images (no streaming).
  * **Commander:** Build Mock Dashboard. Display "Fake" video feed using a local video file.

### Week 2: The Video Link (Integration A)

  * **Objective:** Establishing the "Nervous System."
  * **Merge:** Architect (Camera Init) + Courier (Fragmentation).
  * **Test:** Streaming real-time QQVGA video from Robot to Dashboard.
  * **Metric:** Frame Rate stability.

### Week 3: The Brain & The Body (Integration B)

  * **Objective:** Closing the Control Loop.
  * **Merge:** Architect (Motors) + Commander (LLM Controls).
  * **Test:** Driving the robot using the Laptop keyboard and LLM Auto-Pilot.
  * **Merge:** Eye (Detection) integrated into the loop (Stop-and-Snap logic).

### Week 4: The Survival Test (Final System)

  * **Objective:** Disconnected Mode & SD Sync.
  * **Implementation:** Heartbeat Logic, Autonomous Ultrasonic Navigation, SD Card Write/Read.
  * **Final Demo:**
    1.  Start Connected (Stream active).
    2.  Sever Connection (Power off Gateway).
    3.  Robot auto-navigates and saves "Victim" photo to SD.
    4.  Restore Connection.
    5.  Dashboard syncs and displays the saved victim photo.

-----
