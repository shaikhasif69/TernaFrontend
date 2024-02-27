// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
//   // TextEditingController phoneController = TextEditingController();
//   // static TextEditingController otpController = TextEditingController();
  // final SignInController loginController = Get.put(LoginController());
  // String otp ="";
  bool setVisible = false;
// //obx
// //obs
  @override
  Widget build(BuildContext context) {
    return Placeholder();
    // return Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   // backgroundColor: ,
    //   body: SafeArea(
    //       child: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
    //     child: SingleChildScrollView(
    //       child: Column(children: [
    //         // Align(
    //         //     alignment: Alignment.topLeft,
    //         //     child: GestureDetector(
    //         //       onTap: () {
    //         //         Get.back();
    //         //       },
    //         //       child: Icon(
    //         //         Icons.arrow_back,
    //         //         color: Colors.black54,
    //         //         size: 32,
    //         //       ),
    //         //     )),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         ClipOval(
    //           child: Image.asset(
    //             "/assets/images/logo.png",
    //             fit: BoxFit.fill,
    //             width: 250,
    //             height: 235,
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 20.0,
    //         ),
    //         const Text(
    //           "Registration/Login",
    //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         const Text(
    //           "Enter Your Phone Number and We'll Send You a Verification Code",
    //           style: TextStyle(
    //               fontSize: 14,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.black38),
    //           textAlign: TextAlign.center,
    //         ),
    //         const SizedBox(
    //           height: 38,
    //         ),
    //         Container(
    //           padding: EdgeInsets.all(16.0),
    //           decoration: BoxDecoration(
    //               color: Colors.white, borderRadius: BorderRadius.circular(12)),
    //           child: Column(
    //             children: [
    //               TextFormField(
    //                 // validator: ((value) {
    //                 //   if
    //                 // }),
    //                 onChanged: (value) {
    //                   if (value.length == 10) {
    //                     setState(() {
    //                       setVisible = true;
    //                     });
    //                     print(setVisible);
    //                   } else {
    //                     setState(() {
    //                       setVisible = false;
    //                     });
    //                   }
    //                 },
    //                 controller: loginController.phoneController,
    //                 keyboardType: TextInputType.number,
    //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //                 decoration: InputDecoration(
    //                     enabledBorder: OutlineInputBorder(
    //                         borderSide: BorderSide(color: Colors.black12),
    //                         borderRadius: BorderRadius.circular(18)),
    //                     focusedBorder: OutlineInputBorder(
    //                         borderSide: BorderSide(color: Colors.black12),
    //                         borderRadius: BorderRadius.circular(18)),
    //                     prefix: Padding(
    //                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //                       child: Text(
    //                         "+91",
    //                         style: TextStyle(
    //                             fontSize: 18, fontWeight: FontWeight.bold),
    //                       ),
    //                     ),
    //                     suffixIcon: Icon(
    //                       Icons.check_circle,
    //                       color: Colors.green,
    //                       size: 32,
    //                     )),
    //               ),
    //             ],
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 22,
    //         ),
    //         SizedBox(
    //           width: double.infinity,
    //           child: ElevatedButton(
    //               onPressed: setVisible
    //                   ? () async {
    //                       print(loginController.phoneController.text);
    //                       await FirebaseAuth.instance.verifyPhoneNumber(
    //                         phoneNumber:
    //                             '+91${loginController.phoneController.text}',
    //                         verificationCompleted:
    //                             (PhoneAuthCredential credential) {
    //                           //  otp = credential.smsCode.toString();
    //                           loginController.otpController.text =
    //                               (credential.smsCode.toString());
    //                         },
    //                         verificationFailed: (FirebaseAuthException e) {},
    //                         codeSent:
    //                             (String verificationId, int? resendToken) {
    //                           Get.offNamed('/sendOtp/${verificationId}');
    //                         },
    //                         codeAutoRetrievalTimeout:
    //                             (String verificationId) {},
    //                       );
    //                     }
    //                   : null,
    //               style: ElevatedButton.styleFrom(
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(50)),
    //               ),
    //               child: const Padding(
    //                 padding: EdgeInsets.all(16.0),
    //                 child: Text(
    //                   "Register",
    //                   style: TextStyle(fontSize: 16),
    //                 ),
    //               )),
    //         )
    //       ]),
    //     ),
    //   )),
    // );
  }
}
