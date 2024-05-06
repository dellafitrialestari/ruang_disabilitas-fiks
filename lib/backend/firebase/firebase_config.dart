import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

int id = 0;

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDfTbDH3kKBrZmSXE4g49Xyy2_BJhOwbRQ",
            authDomain: "flutter-authentication-a-3fc81.firebaseapp.com",
            projectId: "flutter-authentication-a-3fc81",
            storageBucket: "flutter-authentication-a-3fc81.appspot.com",
            messagingSenderId: "596158069577",
            appId: "1:596158069577:web:b9cb619f482daa2e603898",
            measurementId: "G-4EZWCY6Z1L"));
  } else {
    await Firebase.initializeApp();
  }
}

@pragma('vm:entry-point')
configureFCM() async {
  await initFirebase();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  messaging.setAutoInitEnabled(true);
  await messaging.setAutoInitEnabled(true);
  debugPrint("Token : ${await messaging.getToken()}");
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );

  if (Platform.isIOS) {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  if (Platform.isAndroid) {
    FirebaseMessaging.onBackgroundMessage((message) async {
      if (kDebugMode) {
        print("Notif data Background: ${message.data}");
      }
      if (message.notification != null) {
        if (kDebugMode) {
          print("Notif title: ${message.notification?.title}");
          print("Notif message: ${message.notification?.body}");
        }
      }
      showNotification(message: message.data["message"] ?? message.notification?.body, title: message.data["title"] ?? message.notification?.title);
      return;
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (kDebugMode) {
        print("Notif data AppOpen: ${message.data}");
      }
      if (message.notification != null) {
        if (kDebugMode) {
          print("Notif title: ${message.notification?.title}");
          print("Notif message: ${message.notification?.body}");
        }
      }
      showNotification(message: message.data["message"] ?? message.notification?.body, title: message.data["title"] ?? message.notification?.title);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (kDebugMode) {
        print("Notif data message: ${message.data}");
      }
      if (message.notification != null) {
        if (kDebugMode) {
          print("Notif title: ${message.notification?.title}");
          print("Notif message: ${message.notification?.body}");
        }
      }
      showNotification(message: message.data["message"] ?? message.notification?.body, title: message.data["title"] ?? message.notification?.title);
    });
  }
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    if (kDebugMode) {
      print('User granted permission');
    }
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    if (kDebugMode) {
      print('User granted provisional permission');
    }
  } else {
    if (kDebugMode) {
      print('User declined or has not accepted permission');
    }
  }
}

showNotification({String? title, String? message}) {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: "ruangdisabilitas_channel",
        channelName: "Ruang Disabilitas Channel",
        channelDescription: "Showing Ruang Disabilitas Notification",
        importance: NotificationImportance.Max,
        defaultPrivacy: NotificationPrivacy.Public,
        enableLights: true,
        enableVibration: true,
        channelShowBadge: true,
        criticalAlerts: true,
        defaultColor: Colors.greenAccent,
        ledColor: Colors.greenAccent),
  ]);
  AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: id++,
        channelKey: "ruangdisabilitas_channel",
        title: title,
        body: message),
  );
}

configureCrashlytics() async {
  await Firebase.initializeApp();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}
