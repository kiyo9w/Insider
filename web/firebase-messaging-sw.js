importScripts('https://www.gstatic.com/firebasejs/10.12.2/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.12.2/firebase-messaging-compat.js');

// Only messagingSenderId is required for the service worker to receive messages.
firebase.initializeApp({
  messagingSenderId: '333746416655',
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((payload) => {
  // Fallback title/body mirror backend push defaults.
  const notificationTitle =
    payload?.notification?.title ?? 'Your answer is ready';
  const notificationOptions = {
    body: payload?.notification?.body ?? '',
  };

  self.registration.showNotification(notificationTitle, notificationOptions);
});


















