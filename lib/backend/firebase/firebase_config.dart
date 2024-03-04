import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCEDNXrfQIrrs6hgAq9vipBXhsnw6rb4fY",
            authDomain: "dating-4w8ert.firebaseapp.com",
            projectId: "dating-4w8ert",
            storageBucket: "dating-4w8ert.appspot.com",
            messagingSenderId: "572003529998",
            appId: "1:572003529998:web:436f0ae4c98da57418135f"));
  } else {
    await Firebase.initializeApp();
  }
}
