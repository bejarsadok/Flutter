import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
// print("soasgs");
  @override
  Widget build(BuildContext context) {
    redirectToLogin(context);
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Center(
            child: Image.asset(
              "assets/images/iit.png",
              width: MediaQuery.of(context).size.width * .3,
              height: MediaQuery.of(context).size.height * .3,
            ),
          )),
    );
  }

  void redirectToLogin(context) async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  LoginPage()),
    );
  }
}