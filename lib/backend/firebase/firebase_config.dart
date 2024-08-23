import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCG_1v-4vc7TSWtvsEkt8uRq2HQCiHV_Ag",
            authDomain: "vbadmin-18095.firebaseapp.com",
            projectId: "vbadmin",
            storageBucket: "vbadmin.appspot.com",
            messagingSenderId: "6516373915",
            appId: "1:6516373915:web:dca1da8da7e5997722c93e",
            measurementId: "G-FEJ6Q8BLMC"));
  } else {
    await Firebase.initializeApp();
  }
}
