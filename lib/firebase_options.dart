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
    apiKey: 'AIzaSyC1Do6tpxOzPPiSkI1blOKmMr3HFXspIU0',
    appId: '1:591594879923:web:e0630052e9bd00e1d529c6',
    messagingSenderId: '591594879923',
    projectId: 'shoppinglist-823a2',
    authDomain: 'shoppinglist-823a2.firebaseapp.com',
    databaseURL: 'https://shoppinglist-823a2-default-rtdb.firebaseio.com',
    storageBucket: 'shoppinglist-823a2.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtFIIzclcs7yAkyzFrPwxxjxkqwfbwHwY',
    appId: '1:591594879923:android:8ac49c8686cbf36cd529c6',
    messagingSenderId: '591594879923',
    projectId: 'shoppinglist-823a2',
    databaseURL: 'https://shoppinglist-823a2-default-rtdb.firebaseio.com',
    storageBucket: 'shoppinglist-823a2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqTAEHdy8-542SCUG6Uz2_nM1WKrBbX6g',
    appId: '1:591594879923:ios:093d0283701d459cd529c6',
    messagingSenderId: '591594879923',
    projectId: 'shoppinglist-823a2',
    databaseURL: 'https://shoppinglist-823a2-default-rtdb.firebaseio.com',
    storageBucket: 'shoppinglist-823a2.firebasestorage.app',
    iosBundleId: 'com.example.readly',
  );
}
