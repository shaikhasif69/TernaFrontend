import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  final nameController = TextEditingController();

  // void registerUser() async {

  // }
  String? selectedValue;

  // List of items in our dropdown menu
  var items = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'AB-',
    'O+',
    'O-',
  ];

  var values = [
    "aPositive",
    "bPositive",
    "bNegative",
    "aNegative",
    "abPositive",
    "abNegative",
    "oPositive",
    "oNegative",
  ];

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
                            myTextField(
                              controller: nameController,
                              hintText: "Name",
                              obscureText: false,
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
                            DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: const Row(
                                  children: [
                                    Icon(
                                      Icons.list,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Select your blood group',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                items: items
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: 50,
                                  width: 350,
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: Colors.white,
                                  ),
                                  elevation: 2,
                                ),
                                iconStyleData: const IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                  ),
                                  iconSize: 14,
                                  iconEnabledColor: Colors.white,
                                  iconDisabledColor: Colors.white,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 200,
                                  width: 380,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                  offset: const Offset(-20, 0),
                                  scrollbarTheme: ScrollbarThemeData(
                                    radius: const Radius.circular(40),
                                    thickness:
                                        MaterialStateProperty.all<double>(6),
                                    thumbVisibility:
                                        MaterialStateProperty.all<bool>(true),
                                  ),
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                  padding: EdgeInsets.only(left: 14, right: 14),
                                ),
                              ),
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
                                  nameController.text,
                                  emailController.text,
                                  phoneController.text,
                                  passwordController.text,
                                  selectedValue,
                                );

                                if (isLoggedIn) {
                                  Get.toNamed("/userDashboard");
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
