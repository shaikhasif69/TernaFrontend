// To parse this JSON data, do
//
//     final campaign = campaignFromJson(jsonString);

import 'dart:convert';

Campaign campaignFromJson(String str) => Campaign.fromJson(json.decode(str));

String campaignToJson(Campaign data) => json.encode(data.toJson());

class Campaign {
  String? title;
  String? description;
  dynamic attachment;
  DateTime? startDate;
  DateTime? endDate;
  dynamic address;
  String? lat;
  String? long;
  dynamic participants;
  DateTime? createdDate;

  Campaign({
    this.title,
    this.description,
    this.attachment,
    this.startDate,
    this.endDate,
    this.address,
    this.lat,
    this.long,
    this.participants,
    this.createdDate,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
        title: json["title"],
        description: json["description"],
        attachment: json["attachment"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        address: json["address"],
        lat: json["lat"],
        long: json["long"],
        participants: json["participants"],
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "attachment": attachment,
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "address": address,
        "lat": lat,
        "long": long,
        "participants": participants,
        "CreatedDate": createdDate?.toIso8601String(),
      };
}
