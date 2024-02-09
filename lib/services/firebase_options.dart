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
        return macos;
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
    apiKey: 'AIzaSyCad27NOWu9RyPA2xUT1FrFA4sp5fAyW5Q',
    appId: '1:1039416533819:web:d9728dab3231f585c30d1e',
    messagingSenderId: '1039416533819',
    projectId: 'messengerapp-ee6c4',
    authDomain: 'messengerapp-ee6c4.firebaseapp.com',
    storageBucket: 'messengerapp-ee6c4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4rKhooUq_1CTHrez8c0EICNivQtw8n14',
    appId: '1:1039416533819:android:65bc6e35c85b2006c30d1e',
    messagingSenderId: '1039416533819',
    projectId: 'messengerapp-ee6c4',
    storageBucket: 'messengerapp-ee6c4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEQHGkqEa0b7ZSt2wr2hBa7BmICt81YgE',
    appId: '1:1039416533819:ios:8dcd37e2cbeb6393c30d1e',
    messagingSenderId: '1039416533819',
    projectId: 'messengerapp-ee6c4',
    storageBucket: 'messengerapp-ee6c4.appspot.com',
    iosBundleId: 'com.example.messengerApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEQHGkqEa0b7ZSt2wr2hBa7BmICt81YgE',
    appId: '1:1039416533819:ios:66706b54a2525decc30d1e',
    messagingSenderId: '1039416533819',
    projectId: 'messengerapp-ee6c4',
    storageBucket: 'messengerapp-ee6c4.appspot.com',
    iosBundleId: 'com.example.messengerApp.RunnerTests',
  );
}