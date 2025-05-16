import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stock_shift_pro/features/auth/view.model/services/session_services.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // Request permission (iOS)
    await _fcm.requestPermission(alert: true, badge: true, sound: true);

    // Get and print token
    await _getTokenAndSaveToSession();

    // Init local notifications (for Android foreground display)
    const androidInit = AndroidInitializationSettings('@mipmap/launcher_icon');
    const iosInit = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );
    await _localNotifications.initialize(initSettings);

    // Foreground message handler
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message);
    });

    // Background tap handler (when app is opened by tapping a notification)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint("🔔 Notification opened: ${message.notification?.title}");
      // You can navigate or handle payload here
    });

    // Optional: Handle background/terminated messages
    RemoteMessage? initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      debugPrint(
        "💤 Opened from terminated: ${initialMessage.notification?.title}",
      );
    }
  }

  void _showNotification(RemoteMessage message) {
    const androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    _localNotifications.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
  }

  Future<void> _getTokenAndSaveToSession() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        debugPrint("🔥 FCM Token: $token");
        await SessionController().saveFCMTokenInPreference(token);
        return;
      }
    } catch (e) {
      debugPrint("❌ Token fetch failed: $e");
    }
  }
}
