import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terna_frontend/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class Authentication {
  static Future<bool> registerUser(email, phone, password) async {
    print("Called");

    var response = await http.post(
      Uri.parse(
        "${AppConstants.IP}/registerUser",
      ),
      body: jsonEncode(
        {
          "userEmail": email,
          "userPhone": "+91" + phone,
          "userPassword": password
        },
      ),
      headers: {"Content-Type": "application/json"},
    );

    var data = await response.body;
    final result = jsonDecode(data);
    print(result);
    var mess = result["data"];
    print("mess" + mess);

    if (mess == "ok") {
      Fluttertoast.showToast(
        msg: "Your Account has been created",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userEmail', email);
      await prefs.setString('userPhone', phone);
      await prefs.setString('userPassword', password);
      await prefs.setBool("isLoggedIn", true);

      return true;
    } else {
      Fluttertoast.showToast(
        msg: mess.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      return false;
    }
  }

  static Future<bool> loginUser(email, password) async {
    print("Called");

    var response = await http.post(
      Uri.parse(
        "${AppConstants.IP}/loginUser",
      ),
      body: jsonEncode(
        {"userEmail": email, "userPassword": password},
      ),
      headers: {"Content-Type": "application/json"},
    );

    var data = await response.body;
    final result = jsonDecode(data);
    print(result);
    var mess = result["user"];

    if (mess != "fail") {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', mess["_id"]);
      await prefs.setString('userEmail', mess["userEmail"]);
      await prefs.setString('userPhone', mess["userPhone"]);
      await prefs.setString('userPassword', mess["userPassword"]);
      await prefs.setBool("isLoggedIn", true);

      return true;
    } else {
      Fluttertoast.showToast(
        msg: "Invalid Email/Password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      return false;
    }
  }
}
