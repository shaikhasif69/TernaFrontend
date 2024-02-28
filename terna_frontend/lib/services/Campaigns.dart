import 'dart:convert';

import 'package:flutter_geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:terna_frontend/models/Campaign.dart';
import 'package:http/http.dart' as http;
import 'package:terna_frontend/utils/app_constants.dart';
import 'package:geocoding/geocoding.dart';

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

  static Future<bool> registerParticipants(
      String userId, String campaignId) async {
    var response = await http.post(
      Uri.parse(
        "${AppConstants.IP}/campaign/registerUserIntoCampaign",
      ),
      body: jsonEncode(
        {"userId": userId, "campaignId": campaignId},
      ),
      headers: {"Content-Type": "application/json"},
    );

    var data = await response.body;

    final result = jsonDecode(data)["data"];

    if (result == "ok") {
      return true;
    }

    return false;
  }

  static Future<bool> checkIfAlreadyRegistered(
      String userId, String campaignId) async {
    print("this is the campaign id: " + campaignId);
    print("this is the user id: " + userId);
    var response = await http.post(
      Uri.parse(
        "${AppConstants.IP}/campaign/checkIfAlreadyRegistered",
      ),
      body: jsonEncode(
        {"userId": userId, "campaignId": campaignId},
      ),
      headers: {"Content-Type": "application/json"},
    );

    var data = await response.body;
    print("this is the fucking dat:  " + data);

    final result = jsonDecode(data)["data"];
    // print("Result : " + result);

    if (result == true) {
      print("this is true for this particular campaign: " + campaignId);
      return true;
    }

    return false;
  }

  static Future<dynamic> getRegisteredCampaignsOfUsers(String? userId) async {
    print("Ddd");

    var response = await http.post(
      Uri.parse(
        "${AppConstants.IP}/campaign/getRegisteredCampaignsOfUsers",
      ),
      body: jsonEncode({"userId": userId}),
      headers: {"Content-Type": "application/json"},
    );

    var data = await response.body;
    final result = jsonDecode(data);
    print("Pleas");
    print(result);

    return result["data"];
  }

  // Future<void> _getAddressFromLatLng(Position position) async {
  //   await placemarkFromCoordinates(
  //           _currentPosition!.latitude, _currentPosition!.longitude)
  //       .then((List<Placemark> placemarks) {
  //     Placemark place = placemarks[0];
  //     setState(() {
  //       _currentAddress =
  //           '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
  //     });
  //   }).catchError((e) {
  //     debugPrint(e);
  //   });
  // }

  // static Future<dynamic> getNearByCampaigns(Position lat, Position lng) async {
  //   await placemarkFromCoordinates(
  //           _currentPosition!.latitude, _currentPosition!.longitude)
  //       .then((List<Placemark> placemarks) {
  //     Placemark place = placemarks[0];

  //     return '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
  //   });
  // }

  static Future<dynamic> getSearchResults(String searchTerm) async {
    if (searchTerm.length > 2) {
      var response = await http.post(
        Uri.parse(
          "${AppConstants.IP}/getSearchResults",
        ),
        body: jsonEncode({"search": searchTerm}),
        headers: {"Content-Type": "application/json"},
      );

      var data = await response.body;
      final result = jsonDecode(data);
      print("Please aa");
      print(result);

      return result["data"];
    }

    return null;
  }

  static Future<Map<String, String>> getAddressFromCoordinates(
      double? latitude, double? longitude) async {
    if (latitude == null || longitude == null) {
      throw 'Latitude or longitude is null';
    }

    try {
      final coordinates = new Coordinates(latitude, longitude);
      List<Placemark> placemarks = await placemarkFromCoordinates(
          coordinates.latitude!, coordinates.longitude!);
      Placemark first = placemarks.first;

      // Extracting address details
      String address = first.street ?? '';
      String city = first.locality ?? '';
      String state = first.administrativeArea ?? '';
      String country = first.country ?? '';

      return {
        'address': address,
        'city': city,
        'state': state,
        'country': country,
      };
    } catch (e) {
      print('Error getting address: $e');
      throw 'Failed to fetch address';
    }
  }

  static Future<dynamic> getNearByCampaigns(String? lat, String? lng) async {
    var latVal = double.parse(lat!);
    var lngVal = double.parse(lng!);
    print(latVal);
    print(latVal);
    Future<Map<String, String>> map = getAddressFromCoordinates(latVal, lngVal);

    print("Maopppp");
    print(map);
  }
}
