import 'package:flutter/material.dart';
import 'package:terna_frontend/services/Campaigns.dart';
import 'package:terna_frontend/tabs/event_featured_item.dart';
import 'package:terna_frontend/utils/app_constants.dart';

class RegisteredCampaigns extends StatelessWidget {
  String? userId;
  RegisteredCampaigns({required this.userId, super.key});

  @override
  Widget build(BuildContext context) {
    Future<dynamic> campaigns = Campaigns.getRegisteredCampaignsOfUsers(userId);
    print("hello");
    print(campaigns);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Registered Campaigns!"),
      ),
      body: FutureBuilder(
        future: campaigns,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;

            if (snapshot.data.length <= 0) {
              return const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "No data found",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }

            return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(right: 20),
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(5),
                  child: EventFeatureCards(
                    snapshot.data[index],
                    color: AppConstants.tAccentColor,
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                textAlign: TextAlign.center,
                "No data found",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
