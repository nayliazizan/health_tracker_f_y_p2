import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAHRlW47RQpnYk2lfc21Klcc7PsoayOq_I",
            authDomain: "ffhealthtrackerfyp2.firebaseapp.com",
            projectId: "ffhealthtrackerfyp2",
            storageBucket: "ffhealthtrackerfyp2.appspot.com",
            messagingSenderId: "371806852131",
            appId: "1:371806852131:web:3bc6642fadfc5865510d96"));
  } else {
    await Firebase.initializeApp();
  }
}
