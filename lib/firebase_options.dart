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
    apiKey: 'AIzaSyBDJcjGmrKMFS-B35MsR5oWpt1PchmqZnI',
    appId: '1:368970870839:web:bd4a48a718d184248dcfb2',
    messagingSenderId: '368970870839',
    projectId: 'catch-platform',
    authDomain: 'catch-platform.firebaseapp.com',
    storageBucket: 'catch-platform.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAm79x7ot7xJ9Ety6nPDad6rg_GTn9QWOQ',
    appId: '1:368970870839:android:b19829d6001f70108dcfb2',
    messagingSenderId: '368970870839',
    projectId: 'catch-platform',
    storageBucket: 'catch-platform.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBM2eSGesbfYQ7XEm4gYAyXWcA9DePxxX4',
    appId: '1:368970870839:ios:a2d9702c36322e3d8dcfb2',
    messagingSenderId: '368970870839',
    projectId: 'catch-platform',
    storageBucket: 'catch-platform.appspot.com',
    androidClientId: '368970870839-bqa9qu21jbf4gl66koho78bbni7d501n.apps.googleusercontent.com',
    iosClientId: '368970870839-kmqjuejcrgmmhfmp5gk2juesu7714j4b.apps.googleusercontent.com',
    iosBundleId: 'com.example.catch201',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBM2eSGesbfYQ7XEm4gYAyXWcA9DePxxX4',
    appId: '1:368970870839:ios:a2d9702c36322e3d8dcfb2',
    messagingSenderId: '368970870839',
    projectId: 'catch-platform',
    storageBucket: 'catch-platform.appspot.com',
    androidClientId: '368970870839-bqa9qu21jbf4gl66koho78bbni7d501n.apps.googleusercontent.com',
    iosClientId: '368970870839-kmqjuejcrgmmhfmp5gk2juesu7714j4b.apps.googleusercontent.com',
    iosBundleId: 'com.example.catch201',
  );
}
