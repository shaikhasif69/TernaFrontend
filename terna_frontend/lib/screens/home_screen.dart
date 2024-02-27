import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:terna_frontend/models/Campaign.dart';
import 'package:terna_frontend/services/Campaigns.dart';
import 'package:terna_frontend/tabs/search_bar_widget.dart';
import 'package:terna_frontend/utils/app_constants.dart';

import '../tabs/event_featured_item.dart';
import '../tabs/upcoming_events.dart';
import '../utils/app_banner.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final DetailPage args = Get.arguments;
  final List upcomingevent = [
    ['Rock Bhai', 'A rap show of the year', 'assets/dummyImages/rap.jpg', 90],
    [
      'Dance Nachle',
      'Show your moves!',
      'assets/dummyImages/danceNachle.jpg',
      90
    ],
    ['King...', 'Tu ake dekhle', 'assets/dummyImages/king.jpg', 90],
    [
      'Chalo Kashmir',
      'An beautiful trip to kashmir',
      'assets/dummyImages/kashmir.jpg',
      90
    ],
    ['Diwali Dhamaka', 'Movie Director', 'assets/dummyImages/diwali.jpg', 90],
    [
      'Chalo Bharat',
      'Unite the country, walk with us!',
      'assets/dummyImages/walk.jpg',
      90
    ],
    ['penguin', 'Save Penguin', 'assets/dummyImages/penguin.jpg', 90],
    ['KBC', 'Kuan banega ... C', 'assets/dummyImages/kbc.jpg', 90],
  ];
  // EventController eventController = Get.put(EventController());

  Future<dynamic> campaigns = Campaigns.getLatest5Campaigns();
  Future<dynamic> upcomingCampaigns = Campaigns.getLatest5UpcomingCampaigns();

  @override
  void dispose() {
    // TODO: implement dispose
    // eventController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    // eventController.getAllEventsForUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.extraColor2,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  SvgPicture.asset("assets/images/app_icon_color.svg"),
                  const SizedBox(
                    height: 5,
                  ),
                  padded(locationWidget()),
                  const SizedBox(
                    height: 15,
                  ),
                  padded(SearchBarWidget()),
                  const SizedBox(
                    height: 25,
                  ),
                  padded(MyAppBanner()),
                  const SizedBox(
                    height: 25,
                  ),
                  padded(
                    Row(
                      children: [
                        const Text(
                          "Campaigns!",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/getAllCampaigns");
                          },
                          child: const Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 247, 110, 110),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 105,
                    child: FutureBuilder(
                      future: campaigns,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return EventFeatureCards(
                                snapshot.data[index],
                                color: AppConstants.tAccentColor,
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
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  padded(subTitle("Nearby Campaigns!")),
                  const SizedBox(
                    height: 10,
                  ),
                  // Obx(() => eventController.isLoading == true
                  //     ? CircularProgressIndicator()
                  //     : _listPopularEvent(eventController.eventList)),
                  const SizedBox(
                    height: 150,
                  ),
                  // padded(subTitle("Best Selling")),
                  // getHorizontalItemSlider(firstEvent),
                  padded(
                    Row(
                      children: [
                        const Text(
                          "Upcoming Campaigns!",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/getAllUpcomingCampaigns");
                          },
                          child: const Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 247, 110, 110),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: FutureBuilder(
                          future: upcomingCampaigns,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return UpComingEvents(
                                    eventName: snapshot.data[index]["title"],
                                    eventSubTitle: snapshot.data[index]
                                        ["description"],
                                    eventImage: snapshot.data[index]
                                        ["attachment"],
                                    eventStartDate: snapshot.data[index]
                                        ["startDate"],
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
                        )

                        // child: ListView.builder(
                        //     itemCount: 4,
                        //     itemBuilder: (context, index) {
                        //       return UpComingEvents(
                        //         eventName: upcomingevent[index][0],
                        //         eventSubTitle: upcomingevent[index][1],
                        //         eventImage: upcomingevent[index][2],
                        //         eventStartDate: upcomingevent[index][3],
                        //       );
                        //     }),
                        ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  // getHorizontalItemSlider(groceries),
                  // SizedBox(
                  //   height: 15,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget padded(Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: widget,
    );
  }

  // Widget getHorizontalItemSlider(List<Events> items) {
  Widget subTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          "See All",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 247, 110, 110)),
        ),
      ],
    );
  }

  Widget locationWidget() {
    String locationIconPath = "assets/images/location_icon.svg";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          locationIconPath,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "Mumbai, Byculla!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}