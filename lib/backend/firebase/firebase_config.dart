import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB-hd0yg_ME7fVIJH7v2QM7pJ5SyV97Aq4",
            authDomain: "qr-wallet-app-y4cu3z-2021.firebaseapp.com",
            projectId: "qr-wallet-app-y4cu3z-2021",
            storageBucket: "qr-wallet-app-y4cu3z-2021.firebasestorage.app",
            messagingSenderId: "301349294950",
            appId: "1:301349294950:web:80f5b650e2ca403146aea7"));
  } else {
    await Firebase.initializeApp();
  }
}
