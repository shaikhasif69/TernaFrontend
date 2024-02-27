import 'dart:convert';

import 'package:terna_frontend/models/Campaign.dart';
import 'package:http/http.dart' as http;
import 'package:terna_frontend/utils/app_constants.dart';

class Campaigns {
  static Future<dynamic> getAllCampaigns() async {
    var response = await http.get(
      Uri.parse(
        "${AppConstants.IP}/campaign/getAllCampaigns",
      ),
      headers: {"Content-Type": "application/json"},
    );

    var data = await response.body;
    final result = jsonDecode(data);
    // List<Campaign> lists = result;
    print(result["data"]);

    return result["data"];
  }
}
