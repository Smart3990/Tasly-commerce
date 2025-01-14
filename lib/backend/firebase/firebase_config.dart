import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCG_B0NhbYUZB1n3cYTPu0mJJJs8Psu-wc",
            authDomain: "unused-fdjvyp.firebaseapp.com",
            projectId: "unused-fdjvyp",
            storageBucket: "unused-fdjvyp.firebasestorage.app",
            messagingSenderId: "991311879808",
            appId: "1:991311879808:web:44294916dd2460b6ae5065"));
  } else {
    await Firebase.initializeApp();
  }
}
