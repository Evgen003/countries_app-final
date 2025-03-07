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
    apiKey: 'AIzaSyBiaYl1DFGlaMREnUHGKRLdVg6Xdg3GKO0',
    appId: '1:1087454902030:web:5c5cc64916b8aa0da3895f',
    messagingSenderId: '1087454902030',
    projectId: 'countries-apk-fc691',
    authDomain: 'countries-apk-fc691.firebaseapp.com',
    storageBucket: 'countries-apk-fc691.firebasestorage.app',
    measurementId: 'G-S43XJWP9HT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCyHd1y4xJa1hKOTFe-SBIJc0Icy5I4J9Q',
    appId: '1:1087454902030:android:a76e5476cb4ee549a3895f',
    messagingSenderId: '1087454902030',
    projectId: 'countries-apk-fc691',
    storageBucket: 'countries-apk-fc691.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9hvd8oBON43eaRhGWxeJ3dOJB0EI-h9Q',
    appId: '1:1087454902030:ios:f431e7b37ee59bdda3895f',
    messagingSenderId: '1087454902030',
    projectId: 'countries-apk-fc691',
    storageBucket: 'countries-apk-fc691.firebasestorage.app',
    iosBundleId: 'com.example.countriesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9hvd8oBON43eaRhGWxeJ3dOJB0EI-h9Q',
    appId: '1:1087454902030:ios:f431e7b37ee59bdda3895f',
    messagingSenderId: '1087454902030',
    projectId: 'countries-apk-fc691',
    storageBucket: 'countries-apk-fc691.firebasestorage.app',
    iosBundleId: 'com.example.countriesApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBiaYl1DFGlaMREnUHGKRLdVg6Xdg3GKO0',
    appId: '1:1087454902030:web:30bd35998a13791da3895f',
    messagingSenderId: '1087454902030',
    projectId: 'countries-apk-fc691',
    authDomain: 'countries-apk-fc691.firebaseapp.com',
    storageBucket: 'countries-apk-fc691.firebasestorage.app',
    measurementId: 'G-368K73SEHQ',
  );
}
