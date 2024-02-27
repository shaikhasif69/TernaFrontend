import 'package:flutter/material.dart';
import 'package:terna_frontend/services/Campaigns.dart';
import 'package:terna_frontend/tabs/event_featured_item.dart';
import 'package:terna_frontend/utils/app_constants.dart';

class AllCampaigns extends StatefulWidget {
  const AllCampaigns({super.key});

  @override
  State<AllCampaigns> createState() => _AllCampaignsState();
}

class _AllCampaignsState extends State<AllCampaigns> {
  Future<dynamic> campaigns = Campaigns.getAllCampaigns();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Campaigns!"),
      ),
      body: FutureBuilder(
        future: campaigns,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;

            if (snapshot.data.length <= 0) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No data found",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
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
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("No data found")],
            );
          }
        },
      ),
    );
  }
}
