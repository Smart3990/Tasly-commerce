import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB7SDU52NWTu9hp8OLnKWHLtra9tAMw6-U",
            authDomain: "tasly-aoiqqh.firebaseapp.com",
            projectId: "tasly-aoiqqh",
            storageBucket: "tasly-aoiqqh.appspot.com",
            messagingSenderId: "1022648215001",
            appId: "1:1022648215001:web:b6ebaf597a5fc93f51a5c8"));
  } else {
    await Firebase.initializeApp();
  }
}
