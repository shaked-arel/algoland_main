// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDJY25FQF6sLx4K81F85BSQrcVzWGVE9WM',
    appId: '1:489196915153:web:d4fc0d4ddcc3ae4ead38f0',
    messagingSenderId: '489196915153',
    projectId: 'algo-3c487',
    authDomain: 'algo-3c487.firebaseapp.com',
    databaseURL: 'https://algo-3c487-default-rtdb.firebaseio.com',
    storageBucket: 'algo-3c487.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNvIL4pmRG2dkvuTWJ4-9jT9N9OO0xc68',
    appId: '1:489196915153:android:6cd75370c5dd804fad38f0',
    messagingSenderId: '489196915153',
    projectId: 'algo-3c487',
    databaseURL: 'https://algo-3c487-default-rtdb.firebaseio.com',
    storageBucket: 'algo-3c487.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDD_9ND50_sqUJN4gezdmNBExChzGXW4BE',
    appId: '1:489196915153:ios:69399193d4d143ebad38f0',
    messagingSenderId: '489196915153',
    projectId: 'algo-3c487',
    databaseURL: 'https://algo-3c487-default-rtdb.firebaseio.com',
    storageBucket: 'algo-3c487.appspot.com',
    iosClientId: '489196915153-b4kge00v6bkjht865nbeo5cp98gsueij.apps.googleusercontent.com',
    iosBundleId: '1',
  );
}
