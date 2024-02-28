import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:terna_frontend/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class Patients {
  static Future<bool> sendNoti() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString("userName");
    String? email = prefs.getString("userEmail");
    String? password = prefs.getString("userPassword");
    String? lat = prefs.getString("userLat");
    String? lng = prefs.getString("userLng");
    String? bloodGroup = prefs.getString("bloodGrp");

    var response = await http.post(
      Uri.parse(
        "${AppConstants.IP}/patient/create-patient",
      ),
      body: jsonEncode(
        {
          "name": name,
          "email": email,
          "password": password,
          "lat": lat,
          "long": lng,
          "bloodGroup": bloodGroup
        },
      ),
      headers: {"Content-Type": "application/json"},
    );

    var data = await response.body;
    final result = jsonDecode(data)["message"];

    print(result);
    if (result == "patient added") {
      return true;
    }

    return false;
  }
}
