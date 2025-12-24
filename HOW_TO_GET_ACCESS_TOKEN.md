# How to Get Firebase Access Token (Super Simple Guide)

## What is an Access Token?
Think of it like a password that lets you send notifications through Firebase's API. You need it to use the script.

## Step-by-Step: Get Your Access Token

### Step 1: Get a Service Account Key (Like a Password File)

1. **Go to Firebase Console**
   - Open https://console.firebase.google.com
   - Click on your project: **insider-kiyo9w**

2. **Find Service Accounts**
   - Click the ⚙️ gear icon (top left) → **"Project settings"**
   - Click the **"Service accounts"** tab (at the top)

3. **Download the Key**
   - You'll see a section called "Firebase Admin SDK"
   - Click the button: **"Generate new private key"**
   - A popup will appear, click **"Generate key"**
   - A JSON file will download (save it somewhere safe!)

   ⚠️ **Important**: This file is like a password - don't share it or commit it to git!

### Step 2: Install Google Cloud CLI (if you don't have it)

**On Mac:**
```bash
# Install using Homebrew (if you have it)
brew install google-cloud-sdk

# OR download from: https://cloud.google.com/sdk/docs/install
```

**On Windows:**
- Download from: https://cloud.google.com/sdk/docs/install
- Run the installer

**On Linux:**
```bash
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
```

### Step 3: Use the Service Account Key to Get Token

1. **Put the JSON file somewhere easy to find**
   - For example: `/Users/yourname/Downloads/firebase-key.json`
   - Or in your project folder (but DON'T commit it to git!)

2. **Run this command** (replace the path with YOUR file path):
   ```bash
   gcloud auth activate-service-account --key-file=/path/to/your/firebase-key.json
   ```

3. **Get the token**:
   ```bash
   gcloud auth print-access-token
   ```

4. **Copy that token** - it looks like: `ya29.a0AfH6SMBx...` (long string)

### Step 4: Use the Token in Your Script

Now you can either:
- **Option A**: Put it directly in the script (see updated script)
- **Option B**: Set it as an environment variable

---

## Even Simpler: Just Use Firebase Console!

Honestly, the **easiest way** is to just use Firebase Console:
1. Go to Cloud Messaging
2. Click "Send test message"
3. Paste your token
4. Done!

But if you want to use the script, follow the steps above! 😊


