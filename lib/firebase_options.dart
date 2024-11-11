// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyDk_GTxl0raBrJ4qBbCNuL6cHYNjDJJr1Y',
    appId: '1:495050247776:web:0c21e7e8713dce77353d05',
    messagingSenderId: '495050247776',
    projectId: 'loginapp-db692',
    authDomain: 'loginapp-db692.firebaseapp.com',
    storageBucket: 'loginapp-db692.firebasestorage.app',
    measurementId: 'G-4V8CFVJCQG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAY9J9HQa7YYL21V9uWe6pDCHxF_NvUS3k',
    appId: '1:495050247776:android:35467b7df1d3b75e353d05',
    messagingSenderId: '495050247776',
    projectId: 'loginapp-db692',
    storageBucket: 'loginapp-db692.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDfItfDp4W0IIAUIq-v_PoqFfhOfqHTzI',
    appId: '1:495050247776:ios:d7c5ee388388e0af353d05',
    messagingSenderId: '495050247776',
    projectId: 'loginapp-db692',
    storageBucket: 'loginapp-db692.firebasestorage.app',
    iosBundleId: 'com.example.firebaseLoginApp',
  );

}