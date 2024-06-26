// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDfTbDH3kKBrZmSXE4g49Xyy2_BJhOwbRQ',
    appId: '1:596158069577:web:b9cb619f482daa2e603898',
    messagingSenderId: '596158069577',
    projectId: 'flutter-authentication-a-3fc81',
    authDomain: 'flutter-authentication-a-3fc81.firebaseapp.com',
    storageBucket: 'flutter-authentication-a-3fc81.appspot.com',
    measurementId: 'G-4EZWCY6Z1L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxOzczbs6CQbcqR64v0QzJtnrET2SsIbc',
    appId: '1:596158069577:android:1a5582dad1676034603898',
    messagingSenderId: '596158069577',
    projectId: 'flutter-authentication-a-3fc81',
    storageBucket: 'flutter-authentication-a-3fc81.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhj9u0wfBbrQjC78wDZenG7u8ZXevXwCU',
    appId: '1:596158069577:ios:5315865cb5e0ced5603898',
    messagingSenderId: '596158069577',
    projectId: 'flutter-authentication-a-3fc81',
    storageBucket: 'flutter-authentication-a-3fc81.appspot.com',
    androidClientId: '596158069577-nbm14e7ucasmatl6nv1htf9ai1cjh8bb.apps.googleusercontent.com',
    iosClientId: '596158069577-nq9ofndct6alaunfpt7ilcvkknrbff85.apps.googleusercontent.com',
    iosBundleId: 'com.mycompany.ruangdisabilitas',
  );
}
