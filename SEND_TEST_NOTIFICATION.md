# How to Send a Test FCM Notification

You have your FCM token:
```
d5HuUkmnTJaa-cEUBFUQFr:APA91bFbKbUxvKKfIJIez_O0KTVExJdwAtayhQI52kZno95f8OLQoyKGrxyos7zTysPxVYfhOB8IxyOvvazvp52ASKyVL4sqmS1kbL1mCwWdH07fkvIqcrs
```

## Method 1: Firebase Console (Recommended - Easiest)

1. **Navigate to Cloud Messaging**
   - Go to [Firebase Console](https://console.firebase.google.com)
   - Select your project: **insider-kiyo9w**
   - In the left sidebar, click **"Engage"** → **"Cloud Messaging"**

2. **Send Test Message**
   - Click **"Send your first message"** or **"New campaign"** button
   - Select **"Send test message"** tab
   - In the **"FCM registration token"** field, paste your token:
     ```
     d5HuUkmnTJaa-cEUBFUQFr:APA91bFbKbUxvKKfIJIez_O0KTVExJdwAtayhQI52kZno95f8OLQoyKGrxyos7zTysPxVYfhOB8IxyOvvazvp52ASKyVL4sqmS1kbL1mCwWdH07fkvIqcrs
     ```
   - Enter a **Notification title** (e.g., "Test Notification")
   - Enter **Notification text** (e.g., "Hello from Firebase!")
   - Click **"Test"** button

3. **Check Your App**
   - If app is in **foreground**: You should see a Flushbar notification at the top
   - If app is in **background**: You should see a system notification
   - If app is **terminated**: Tap the notification to open the app

## Method 2: Using Firebase Console Campaign (For Multiple Devices)

1. Go to **Cloud Messaging** → **"New campaign"**
2. Select **"Firebase Notification messages"**
3. Enter notification details:
   - **Notification title**
   - **Notification text**
   - **Notification image** (optional)
4. Click **"Send test message"** tab
5. Add your FCM token
6. Click **"Test"**

## Method 3: Using FCM API v1 (Advanced)

### Prerequisites
- Service account JSON key from Firebase Console
- Or Firebase Admin SDK access

### Steps

1. **Get Service Account Key**
   - Firebase Console → Project Settings → Service Accounts
   - Click **"Generate new private key"**
   - Save the JSON file securely

2. **Get Access Token**
   ```bash
   # Using gcloud CLI
   gcloud auth activate-service-account --key-file=path/to/service-account.json
   gcloud auth print-access-token
   ```

3. **Send Notification via API**
   ```bash
   curl -X POST https://fcm.googleapis.com/v1/projects/insider-kiyo9w/messages:send \
     -H "Authorization: Bearer YOUR_ACCESS_TOKEN" \
     -H "Content-Type: application/json" \
     -d '{
       "message": {
         "token": "d5HuUkmnTJaa-cEUBFUQFr:APA91bFbKbUxvKKfIJIez_O0KTVExJdwAtayhQI52kZno95f8OLQoyKGrxyos7zTysPxVYfhOB8IxyOvvazvp52ASKyVL4sqmS1kbL1mCwWdH07fkvIqcrs",
         "notification": {
           "title": "Test Notification",
           "body": "This is a test message!"
         },
         "data": {
           "type": "test",
           "click_action": "FLUTTER_NOTIFICATION_CLICK"
         }
       }
     }'
   ```

## Method 4: Using Postman

1. **Setup Request**
   - Method: `POST`
   - URL: `https://fcm.googleapis.com/v1/projects/insider-kiyo9w/messages:send`
   - Headers:
     - `Authorization: Bearer YOUR_ACCESS_TOKEN`
     - `Content-Type: application/json`

2. **Body (JSON)**
   ```json
   {
     "message": {
       "token": "d5HuUkmnTJaa-cEUBFUQFr:APA91bFbKbUxvKKfIJIez_O0KTVExJdwAtayhQI52kZno95f8OLQoyKGrxyos7zTysPxVYfhOB8IxyOvvazvp52ASKyVL4sqmS1kbL1mCwWdH07fkvIqcrs",
       "notification": {
         "title": "Test Notification",
         "body": "Hello from Postman!"
       },
       "data": {
         "type": "test"
       }
     }
   }
   ```

## Testing Different App States

### Foreground (App is open)
- Notification will trigger `FirebaseMessaging.onMessage`
- Your app shows a Flushbar notification (see `app.dart`)

### Background (App minimized)
- Notification appears in system tray
- Tapping it triggers `FirebaseMessaging.onMessageOpenedApp`

### Terminated (App closed)
- Notification appears in system tray
- Tapping it opens the app and triggers `FirebaseMessaging.getInitialMessage`

## Troubleshooting

### No notification received
- ✅ Verify FCM token is correct
- ✅ Check app has notification permissions
- ✅ Ensure Firebase is initialized (`main.dart`)
- ✅ Check device is connected to internet
- ✅ For iOS: Verify APNS is configured
- ✅ Check logs for errors

### Notification received but not displayed
- ✅ Check `_handleForegroundMessage` in `app.dart`
- ✅ Verify notification service is initialized
- ✅ Check if app is in foreground (should show Flushbar)

### Token issues
- Tokens can change (e.g., app reinstall, token refresh)
- Check logs for token refresh events
- Get new token: `await notificationService.getToken()`

## Next Steps

After testing, you'll want to:
1. **Implement backend token registration** - Update `_sendTokenToBackend()` in `fcm_notification_service.dart`
2. **Set up notification routing** - Handle `message.data` to navigate to specific screens
3. **Configure notification channels** (Android) - For different notification types
4. **Add notification actions** - Custom buttons in notifications


