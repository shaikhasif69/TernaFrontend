import 'dart:convert';

import 'package:terna_frontend/models/Campaign.dart';
import 'package:http/http.dart' as http;
import 'package:terna_frontend/utils/app_constants.dart';

class Campaigns {
  static Future<dynamic> getLatest5Campaigns() async {
    var response = await http.get(
      Uri.parse(
        "${AppConstants.IP}/campaign/getLatest5Campaign",
      ),
      headers: {"Content-Type": "application/json"},
    );

    var data = await response.body;
    final result = jsonDecode(data);
    print("Please aa");
    print(result);

    return result["data"];
  }

  static Future<dynamic> getAllCampaigns() async {
    var response = await http.get(
      Uri.parse(
        "${AppConstants.IP}/campaign/getAllCampaigns",
      ),
      headers: {"Content-Type": "application/json"},
    );

    var data = await response.body;
    final result = jsonDecode(data);
    print("Please aa");
    print(result);

    return result["data"];
  }

  static Future<dynamic> getLatest5UpcomingCampaigns() async {
    var response = await http.get(
      Uri.parse(
        "${AppConstants.IP}/campaign/getLatest5UpcomingCampaigns",
      ),
      headers: {"Content-Type": "application/json"},
    );

    var data = await response.body;
    final result = jsonDecode(data);
    print("Please aa");
    print(result);

    return result["data"];
  }

  static Future<dynamic> getAllUpcomingCampaigns() async {
    var response = await http.get(
      Uri.parse(
        "${AppConstants.IP}/campaign/getAllUpcomingCampaigns",
      ),
      headers: {"Content-Type": "application/json"},
    );

    var data = await response.body;
    final result = jsonDecode(data);
    print("Please aa");
    print(result);

    return result["data"];
  }
}
