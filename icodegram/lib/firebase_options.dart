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
    apiKey: 'AIzaSyCQD0An3PFogj40WeXKOicRf0x7n6jUKT8',
    appId: '1:733107849570:web:dbed610cbaac068491443b',
    messagingSenderId: '733107849570',
    projectId: 'flutter-1-social-media-app',
    authDomain: 'flutter-1-social-media-app.firebaseapp.com',
    storageBucket: 'flutter-1-social-media-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBG43D3nKdJSfC0BqLhUBC-XvjmwUGoygY',
    appId: '1:733107849570:android:ef91d68bb612700f91443b',
    messagingSenderId: '733107849570',
    projectId: 'flutter-1-social-media-app',
    storageBucket: 'flutter-1-social-media-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjEciAh1u0OWF1g5HJRsadaTZ2TyM3HnY',
    appId: '1:733107849570:ios:94a1d13a6508118f91443b',
    messagingSenderId: '733107849570',
    projectId: 'flutter-1-social-media-app',
    storageBucket: 'flutter-1-social-media-app.appspot.com',
    iosClientId: '733107849570-2h37qnng0pdrrfsv32tgj1s0rijqb5s8.apps.googleusercontent.com',
    iosBundleId: 'com.example.icodegram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjEciAh1u0OWF1g5HJRsadaTZ2TyM3HnY',
    appId: '1:733107849570:ios:d0daeeaaf662a50591443b',
    messagingSenderId: '733107849570',
    projectId: 'flutter-1-social-media-app',
    storageBucket: 'flutter-1-social-media-app.appspot.com',
    iosClientId: '733107849570-9av84ekcd27u114ss2p3mocands3scn2.apps.googleusercontent.com',
    iosBundleId: 'com.example.icodegram.RunnerTests',
  );
}
