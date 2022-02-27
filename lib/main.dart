import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'SplashScreen.dart';
import 'login_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBh-FpmPYdLjc9XoVC9e9nk8pcEzrioAmY",
          authDomain: "firestroe-f9939.firebaseapp.com",
          projectId: "firestroe-f9939",
          storageBucket: "firestroe-f9939.appspot.com",
          messagingSenderId: "342603296161",
          appId: "1:342603296161:web:f9142c0381b02b81b3efe0",
          measurementId: "G-60403BX8GG"));
  runApp(MyApp());
  print("redirect ") ;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato',
      ),
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    );

  }
}
