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
    apiKey: 'AIzaSyAECiPxxyP7eMIk2AtpbEXbv18ouh8i-_0',
    appId: '1:335764061654:web:f31439b8872e0a14c4b877',
    messagingSenderId: '335764061654',
    projectId: 'farm-47ec9',
    authDomain: 'farm-47ec9.firebaseapp.com',
    storageBucket: 'farm-47ec9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGi01eHbCan3G52JpScOx2LYoSBeBe72s',
    appId: '1:335764061654:android:caf0b95525c2c131c4b877',
    messagingSenderId: '335764061654',
    projectId: 'farm-47ec9',
    storageBucket: 'farm-47ec9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFhdiYtcqxL8etoLZauIyh4jwBtpFYWo4',
    appId: '1:335764061654:ios:4177acf98dae907ac4b877',
    messagingSenderId: '335764061654',
    projectId: 'farm-47ec9',
    storageBucket: 'farm-47ec9.appspot.com',
    iosClientId: '335764061654-0fr6v603n29hmob4cqjdt1uukrqg6mo1.apps.googleusercontent.com',
    iosBundleId: 'com.example.myapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFhdiYtcqxL8etoLZauIyh4jwBtpFYWo4',
    appId: '1:335764061654:ios:4177acf98dae907ac4b877',
    messagingSenderId: '335764061654',
    projectId: 'farm-47ec9',
    storageBucket: 'farm-47ec9.appspot.com',
    iosClientId: '335764061654-0fr6v603n29hmob4cqjdt1uukrqg6mo1.apps.googleusercontent.com',
    iosBundleId: 'com.example.myapp',
  );
}