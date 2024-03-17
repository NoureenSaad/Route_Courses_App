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
    apiKey: 'AIzaSyC7VcyhHwfDA-qlXUhCM6qnWxrrYyt8o5w',
    appId: '1:64924680870:web:20d440581fbcb0ff75ea67',
    messagingSenderId: '64924680870',
    projectId: 'route-courses-app',
    authDomain: 'route-courses-app.firebaseapp.com',
    storageBucket: 'route-courses-app.appspot.com',
    measurementId: 'G-6W3082FQ8Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhUB9khxjq7efuCAq-tH7378Osh4esysI',
    appId: '1:64924680870:android:62ca93f792eb92c375ea67',
    messagingSenderId: '64924680870',
    projectId: 'route-courses-app',
    storageBucket: 'route-courses-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8oJS_dO9cI2seLm1HDeUn7e4DrNUPwWU',
    appId: '1:64924680870:ios:208b500b3839575675ea67',
    messagingSenderId: '64924680870',
    projectId: 'route-courses-app',
    storageBucket: 'route-courses-app.appspot.com',
    iosBundleId: 'com.example.routeCoursesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8oJS_dO9cI2seLm1HDeUn7e4DrNUPwWU',
    appId: '1:64924680870:ios:6438b044de3c693875ea67',
    messagingSenderId: '64924680870',
    projectId: 'route-courses-app',
    storageBucket: 'route-courses-app.appspot.com',
    iosBundleId: 'com.example.routeCoursesApp.RunnerTests',
  );
}
