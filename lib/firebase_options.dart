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
    apiKey: 'AIzaSyApP1UeL0eyV8Ho3n_sV43iviQ2cM3ZDj8',
    appId: '1:962576412561:web:4388c338e61299ae34b430',
    messagingSenderId: '962576412561',
    projectId: 'summit-rock',
    authDomain: 'summit-rock.firebaseapp.com',
    storageBucket: 'summit-rock.appspot.com',
    measurementId: 'G-9D2WPDDZHS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDl4HEYMMRGR1J2ND3L7q12zAbIWD8Vxmk',
    appId: '1:962576412561:android:13fcf59985a0a44134b430',
    messagingSenderId: '962576412561',
    projectId: 'summit-rock',
    storageBucket: 'summit-rock.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwP65bbP-sL7WHNTbxh8Jr9S6naYJlbhM',
    appId: '1:962576412561:ios:27fbce3536c397ab34b430',
    messagingSenderId: '962576412561',
    projectId: 'summit-rock',
    storageBucket: 'summit-rock.appspot.com',
    iosBundleId: 'dev.clawworks.summitRock',
  );

}