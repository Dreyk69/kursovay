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
    apiKey: 'AIzaSyBFRYRgSVNvWLMhcbOhBOYLxqnx7A0cs8g',
    appId: '1:264844571182:web:926de6c9fdcc945d4065bf',
    messagingSenderId: '264844571182',
    projectId: 'kursach-53532',
    authDomain: 'kursach-53532.firebaseapp.com',
    storageBucket: 'kursach-53532.appspot.com',
    measurementId: 'G-8FHXFNDYND',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9gA5XaxduplYpKdAZIcyzv9MmbdlJvAA',
    appId: '1:264844571182:android:1a71f8b1f2e67ecb4065bf',
    messagingSenderId: '264844571182',
    projectId: 'kursach-53532',
    storageBucket: 'kursach-53532.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgJt1UYPlAwBEpB1WTc_qsgybsvqcqVDw',
    appId: '1:264844571182:ios:5bb1710b9013eff64065bf',
    messagingSenderId: '264844571182',
    projectId: 'kursach-53532',
    storageBucket: 'kursach-53532.appspot.com',
    iosBundleId: 'com.example.kursovay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgJt1UYPlAwBEpB1WTc_qsgybsvqcqVDw',
    appId: '1:264844571182:ios:5bb1710b9013eff64065bf',
    messagingSenderId: '264844571182',
    projectId: 'kursach-53532',
    storageBucket: 'kursach-53532.appspot.com',
    iosBundleId: 'com.example.kursovay',
  );
}
