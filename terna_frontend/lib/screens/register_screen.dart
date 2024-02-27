import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terna_frontend/screens/dashboard.dart';
import 'package:terna_frontend/screens/login_screen.dart';
import 'package:terna_frontend/services/Authentication.dart';
import 'package:terna_frontend/utils/app_constants.dart';
import 'package:terna_frontend/utils/button.dart';
import 'package:terna_frontend/utils/text_field.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // void registerUser() async {

  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 500,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: AppConstants.themeColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: 90,
                        height: 90,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Aarogya Rakt",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 35,
                            color: Colors.white),
                      ),
                      //welcome back you have been missed !
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              color: Colors.grey.shade200,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                          // border: Border.all(color: AppConstants.themeColor),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Register Now",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            myTextField(
                              controller: emailController,
                              hintText: "Email",
                              obscureText: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            myTextField(
                              controller: phoneController,
                              hintText: "Phone",
                              obscureText: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            myTextField(
                                controller: passwordController,
                                hintText: "Password",
                                obscureText: true),
                            const SizedBox(
                              height: 10,
                            ),

                            //forgot password?
                            const SizedBox(
                              height: 25,
                            ),

                            MyButton(
                              text: "Create Account",
                              onTap: () async {
                                bool isLoggedIn =
                                    await Authentication.registerUser(
                                        emailController.text,
                                        phoneController.text,
                                        passwordController.text);

                                if (isLoggedIn) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Dashboard(),
                                    ),
                                  );
                                }
                              },
                            ),

                            // const SizedBox(
                            //   height: 40,
                            // ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already a member?",
                                  style: TextStyle(fontSize: 18),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
