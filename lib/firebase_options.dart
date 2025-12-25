import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNKiEiZeRR8VUIkJmyBrg0POX4dl9hFSs',
    appId: '1:801940329146:ios:12bec2910733f8f8656883',
    messagingSenderId: '801940329146',
    projectId: 'chatw-d4789',
    storageBucket: 'chatw-d4789.firebasestorage.app',
    iosBundleId: 'com.aoisora.chatw',
    iosClientId: '801940329146-6ahi2s0q21s51p3pfn0fd3034llr5pdi.apps.googleusercontent.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNKiEiZeRR8VUIkJmyBrg0POX4dl9hFSs',
    appId: '1:801940329146:android:placeholder656883',
    messagingSenderId: '801940329146',
    projectId: 'chatw-d4789',
    storageBucket: 'chatw-d4789.firebasestorage.app',
  );
}
