import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terna_frontend/screens/signIn_screen.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';
// import 'package:get/get.dart';
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => SignIn(),
        ),
      );

      // Shared preferences should be used here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
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
                  TextSpan(text: 'Life', style: TextStyle(color: Colors.black)),
                  TextSpan(
                    text: 'Link',
                    style: TextStyle(color: Colors.blueAccent),
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
