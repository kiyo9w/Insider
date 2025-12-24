# Firebase Cloud Messaging Setup Guide

## Prerequisites
- Firebase project created at https://console.firebase.google.com
- FlutterFire CLI installed: `dart pub global activate flutterfire_cli`

## Setup Steps

### 1. Configure Firebase
```bash
flutterfire configure
```
This will:
- Generate `lib/configs/firebase_options.dart` with your project credentials
- Update `google-services.json` (Android)
- Create/update `GoogleService-Info.plist` (iOS)

### 2. iOS Configuration

#### Add GoogleService-Info.plist
1. Download from Firebase Console
2. Add to `ios/Runner/` directory
3. Add to Xcode project

#### Enable Push Notifications
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select Runner target → Signing & Capabilities
3. Click "+ Capability" → Push Notifications
4. Click "+ Capability" → Background Modes
5. Enable "Remote notifications"

#### APNS Setup
1. Generate APNs key in Apple Developer Console
2. Upload to Firebase Console → Project Settings → Cloud Messaging → iOS app

### 3. Android Configuration

#### Verify google-services.json
- Located at `android/app/google-services.json`
- Auto-updated by `flutterfire configure`

#### Notification Icon
- Custom icon at `android/app/src/main/res/drawable/ic_notification.xml`
- Should be white/transparent for Android 5.0+

### 4. Testing

#### Test Foreground Notifications
```bash
flutter run
```
Send test message from Firebase Console → Cloud Messaging → Send test message

#### Test Background Notifications
1. Put app in background
2. Send test message
3. Tap notification to open app

#### Test Terminated State
1. Force close app
2. Send test message
3. Tap notification to open app

### 5. Backend Integration

Update `_sendTokenToBackend()` in `fcm_notification_service.dart`:
```dart
Future<void> _sendTokenToBackend(String token) async {
  // POST token to your backend
  await _apiClient.post('/api/fcm/register', {
    'token': token,
    'platform': Platform.isIOS ? 'ios' : 'android',
  });
}
```

### 6. Topic Subscriptions

```dart
// Subscribe to topics
await notificationService.subscribeToTopic('news');
await notificationService.subscribeToTopic('updates');

// Unsubscribe
await notificationService.unsubscribeFromTopic('news');
```

### 7. Message Handling

#### Foreground Messages
Handled in `app.dart` → `_handleForegroundMessage()`

#### Background/Terminated Messages
Handled in `_firebaseMessagingBackgroundHandler()`

#### Message Opened App
Handled in `app.dart` → `_handleMessageOpenedApp()`

## Notification Channels (Android)

Configured in `MainActivity.kt`:
- `high_priority_channel` - For urgent notifications
- `default_channel` - For general notifications

## Troubleshooting

### iOS: No notifications received
- Verify APNS key uploaded to Firebase
- Check `Runner.entitlements` exists
- Verify capabilities enabled in Xcode
- Test on physical device (simulator doesn't support push)

### Android: No notifications received
- Verify `google-services.json` is correct
- Check notification permissions granted
- Verify Firebase project matches package name

### Token not generated
- Check Firebase initialization in `main.dart`
- Verify permissions requested
- Check logs for errors

## Production Checklist

- [ ] Update `firebase_options.dart` with production credentials
- [ ] Change `aps-environment` to `production` in `Runner.entitlements`
- [ ] Upload production APNS certificate to Firebase
- [ ] Test on production build
- [ ] Implement backend token registration
- [ ] Set up notification analytics
- [ ] Configure notification icons/sounds
- [ ] Test deep linking from notifications
