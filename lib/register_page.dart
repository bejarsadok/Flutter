import 'dart:html';

import 'package:flutter/material.dart';
import 'widgets/custom_checkbox.dart';
import 'widgets/primary_button.dart';
import 'theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'list_users.dart';
import 'fire_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisible = false;
  bool passwordConfrimationVisible = false;

  get color => null;

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  final TextEditingController controllerEmail = new TextEditingController();
  final TextEditingController controllerPassword = new TextEditingController();
  final TextEditingController controllerUsername = new TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logoISB1-1.png',
                      width: 200,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Register new account',
                    style: heading2.copyWith(color: textBlack),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    'assets/images/accent.png',
                    width: 99,
                    height: 4,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: heading6.copyWith(color: textGrey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        controller: controllerEmail,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: heading6.copyWith(color: textGrey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        controller: controllerUsername,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextFormField(
                        obscureText: !passwordVisible,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: heading6.copyWith(color: textGrey),
                          suffixIcon: IconButton(
                            color: textGrey,
                            splashRadius: 1,
                            icon: Icon(passwordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                            onPressed: togglePassword,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        controller: controllerPassword,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextFormField(
                        obscureText: !passwordConfrimationVisible,
                        decoration: InputDecoration(
                          hintText: 'Password Confirmation',
                          hintStyle: heading6.copyWith(color: textGrey),
                          suffixIcon: IconButton(
                            color: textGrey,
                            splashRadius: 1,
                            icon: Icon(passwordConfrimationVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                            onPressed: () {
                              setState(() {
                                passwordConfrimationVisible =
                                    !passwordConfrimationVisible;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomCheckbox(),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'By creating an account, you agree to our',
                        style: regular16pt.copyWith(color: textGrey),
                      ),
                      Text(
                        'Terms & Conditions',
                        style: regular16pt.copyWith(color: primaryBlue),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width ,
                height: 56,
                child: ElevatedButton(
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white,fontSize: heading5.fontSize),
                    ),
                    onPressed: () async {
                      await firestore.collection("register").add({
                        "email": controllerEmail.text,
                        "password": controllerPassword.text,
                        "username": controllerUsername.text,

                      });
                      await FireAuth.registerUsingEmailPassword(
                        email: controllerEmail.text,
                        password: controllerPassword.text,
                        name: controllerUsername.text,
                      );
                      controllerEmail.clear();
                      controllerPassword.clear();
                      controllerUsername.clear();

                      setState(() {});

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListUserPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: primaryBlue,
                        onPrimary: Colors.white,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(14.0),
                        ),

                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
