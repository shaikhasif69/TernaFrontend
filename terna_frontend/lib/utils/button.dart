import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  Function()? onTap;
  MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onTap,
      child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                ),
                child: Center(child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),)),
              ),
    );
  }
}