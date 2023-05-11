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
    apiKey: 'AIzaSyCLW0Ftd4wp7NRZHAufqIDfZ_2X0_nAt0Q',
    appId: '1:129176526505:web:dc58dd488a11c69cb093b8',
    messagingSenderId: '129176526505',
    projectId: 'opinions-app-d7edf',
    authDomain: 'opinions-app-d7edf.firebaseapp.com',
    storageBucket: 'opinions-app-d7edf.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsR01OgAL1SYRdZ0uuUc7kC0rTX8C1UfI',
    appId: '1:129176526505:android:9cd8364e943f2337b093b8',
    messagingSenderId: '129176526505',
    projectId: 'opinions-app-d7edf',
    storageBucket: 'opinions-app-d7edf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUKKDqMbexXtRP4QSS8lWOoCbEaEI3qIc',
    appId: '1:129176526505:ios:cddd818e664b8d1bb093b8',
    messagingSenderId: '129176526505',
    projectId: 'opinions-app-d7edf',
    storageBucket: 'opinions-app-d7edf.appspot.com',
    iosClientId: '129176526505-n0uft8j64qb9re0nhihro0mau5uvtj9u.apps.googleusercontent.com',
    iosBundleId: 'com.example.opinionsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUKKDqMbexXtRP4QSS8lWOoCbEaEI3qIc',
    appId: '1:129176526505:ios:cddd818e664b8d1bb093b8',
    messagingSenderId: '129176526505',
    projectId: 'opinions-app-d7edf',
    storageBucket: 'opinions-app-d7edf.appspot.com',
    iosClientId: '129176526505-n0uft8j64qb9re0nhihro0mau5uvtj9u.apps.googleusercontent.com',
    iosBundleId: 'com.example.opinionsApp',
  );
}
