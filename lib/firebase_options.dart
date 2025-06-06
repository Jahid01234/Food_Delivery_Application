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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0jviX6ea7a3somapYtbYCnsuKL6BfJuI',
    appId: '1:405740710757:android:a49bb81a2f6d4e5e540f8c',
    messagingSenderId: '405740710757',
    projectId: 'my-first-project-9ad78',
    storageBucket: 'my-first-project-9ad78.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASOfPvpZ-B7I1tYSN266sX2KsNORl-ahY',
    appId: '1:405740710757:ios:e3b2da5908775fd5540f8c',
    messagingSenderId: '405740710757',
    projectId: 'my-first-project-9ad78',
    storageBucket: 'my-first-project-9ad78.firebasestorage.app',
    androidClientId: '405740710757-c4v429cktitgr43jl8gvrqoa1jdo0vjo.apps.googleusercontent.com',
    iosClientId: '405740710757-ubv15slqtlk80n53eh99lk02mv0nn9qv.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodDeliveryApplication',
  );
}
