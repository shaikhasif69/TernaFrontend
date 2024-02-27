import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './login_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    showIntro();
  }

  void showIntro() {
    Timer(const Duration(seconds: 3), () async {
      // Shared preferences should be used here
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      bool? isLoggedIn = prefs.getBool("isLoggedIn");

      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Get.toNamed("/userDashboard");
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffD91106),
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 300,
                ),
                const SizedBox(
                  height: 25,
                ),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 54,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5,
                      ),
                    ),
                    children: const [
                      TextSpan(
                          text: 'Aarogya ',
                          style: TextStyle(color: Colors.white)),
                      TextSpan(
                        text: 'Rakt',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  textScaleFactor: 0.5,
                )
              ],
            ),
          ),
        ));
  }
}
