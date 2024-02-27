import 'package:flutter/material.dart';
import 'package:terna_frontend/utils/button.dart';
import 'package:terna_frontend/utils/text_field.dart';

class LoginPage extends StatelessWidget {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  void singInMethod() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              // const SizedBox(
              //   height: 40,
              // ),
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              //logo
          
              const Text(
                "Welcome back, You have been missed!",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              //welcome back you have been missed !
              const SizedBox(
                height: 30,
              ),
              myTextField(
                  controller: userNameController,
                  hintText: "Username",
                  obscureText: false),
              const SizedBox(
                height: 10,
              ),
              //username textfield
              myTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true),
          
              //password textfield
              const SizedBox(
                height: 10,
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Text("Forgot Password?"),
                  )
                ],
              ),
          
              //forgot password?
              const SizedBox(
                height: 25,
              ),
          
              MyButton(
                onTap: singInMethod,
              ),
          
              const SizedBox(
                height: 40,
              ),
              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or Continue with!"),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ))
                  ],
                ),
              ),
          
              SizedBox(height: 30,),
              //or continue with?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      // padding: EdgeInsets.all(10),
          height: 70,
          width: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        "assets/google.png",
                        fit: BoxFit.fitWidth,
                        // height: 100,
                      )),
                      SizedBox(width: 20,),
            Container(
                      // padding: EdgeInsets.all(10),
          height: 70,
          width: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        "assets/3.png",
                        fit: BoxFit.fitWidth,
                        // height: 100,
                      )),
                  // Image.asset(
                  //   "assets/3.png",
                  //   height: 200,
                  // )
                  // image:
                ],
              ),

              const SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Text("Not a member?"), SizedBox(width: 10,),
              Text("Register now?", style: TextStyle(color: Colors.blue),)
             ],
            )          

              //not a member? register now ?
            ]),
          ),
        ),
      ),
    );
  }
}
