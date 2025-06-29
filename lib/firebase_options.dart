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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyC0A8fpHBLKhzbRFQeRN_zkddrUCwI1fN8',
    appId: '1:726011282042:web:deaebda2e25da0c10031c3',
    messagingSenderId: '726011282042',
    projectId: 'mimetic-campus-405713',
    authDomain: 'mimetic-campus-405713.firebaseapp.com',
    storageBucket: 'mimetic-campus-405713.appspot.com',
    measurementId: 'G-WD65WK8KG4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQqWYqv2MevVheJFFLjhHWfZtPtkLH_dY',
    appId: '1:726011282042:android:eddd81a7a0bc7d670031c3',
    messagingSenderId: '726011282042',
    projectId: 'mimetic-campus-405713',
    storageBucket: 'mimetic-campus-405713.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCF8VqCHJeAmkQPhxSSi3oHNS_qBuolC3c',
    appId: '1:726011282042:ios:a75729eff1d0b39c0031c3',
    messagingSenderId: '726011282042',
    projectId: 'mimetic-campus-405713',
    storageBucket: 'mimetic-campus-405713.appspot.com',
    iosBundleId: 'com.example.dinGuideApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCF8VqCHJeAmkQPhxSSi3oHNS_qBuolC3c',
    appId: '1:726011282042:ios:a75729eff1d0b39c0031c3',
    messagingSenderId: '726011282042',
    projectId: 'mimetic-campus-405713',
    storageBucket: 'mimetic-campus-405713.appspot.com',
    iosBundleId: 'com.example.dinGuideApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC0A8fpHBLKhzbRFQeRN_zkddrUCwI1fN8',
    appId: '1:726011282042:web:e8285bf54a2504270031c3',
    messagingSenderId: '726011282042',
    projectId: 'mimetic-campus-405713',
    authDomain: 'mimetic-campus-405713.firebaseapp.com',
    storageBucket: 'mimetic-campus-405713.appspot.com',
    measurementId: 'G-R1QDC8MHDS',
  );
}
