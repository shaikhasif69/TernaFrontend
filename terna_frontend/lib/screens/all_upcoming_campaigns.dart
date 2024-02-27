import 'package:flutter/material.dart';
import 'package:terna_frontend/services/Campaigns.dart';
import 'package:terna_frontend/tabs/upcoming_events.dart';

class AllUpcomingCampaignsPage extends StatefulWidget {
  const AllUpcomingCampaignsPage({super.key});

  @override
  State<AllUpcomingCampaignsPage> createState() =>
      _AllUpcomingCampaignsPageState();
}

class _AllUpcomingCampaignsPageState extends State<AllUpcomingCampaignsPage> {
  Future<dynamic> campaigns = Campaigns.getAllUpcomingCampaigns();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Upcoming Campaigns!"),
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
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: UpComingEvents(
                    eventName: snapshot.data[index]["title"],
                    eventSubTitle: snapshot.data[index]["description"],
                    eventImage: snapshot.data[index]["attachment"],
                    eventStartDate: snapshot.data[index]["startDate"],
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
    ;
  }
}
