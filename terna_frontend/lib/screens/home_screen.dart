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
import 'campaign_details_page.dart';

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

  Future<dynamic> campaigns = Campaigns.getAllCampaigns();

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
                  padded(subTitle("Campaigns!")),
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
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(DetailPage(data: snapshot.data[index]));
                                  },
                                  child: EventFeatureCards(
                                    snapshot.data[index],
                                    color: AppConstants.tAccentColor,
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Text("No data available");
                          }
                        },
                      )),
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
                  padded(subTitle("Upcommig Campaigns")),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return UpComingEvents(
                              eventName: upcomingevent[index][0],
                              eventSubTitle: upcomingevent[index][1],
                              eventImage: upcomingevent[index][2],
                              eventStartDate: upcomingevent[index][3],
                            );
                          }),
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

  // _listPopularEvent(List<MyEvent> events) => Container(
  //       width: double.infinity,
  //       height: 270,
  //       padding: const EdgeInsets.only(left: 16),
  //       child: ListView.builder(
  //         physics: const BouncingScrollPhysics(),
  //         scrollDirection: Axis.horizontal,
  //         itemCount: events.length,
  //         itemBuilder: (context, index) {
  //           print("heuyu");
  //           print(events.length);
  //           return GestureDetector(
  //             // onTap: () => Navigator.pushNamed(
  //             //   arguments: events[index].toJson(),
  //             //   context,
  //             //   (),
  //             // ),
  //             // onTap: () {
  //             //   Get.toNamed('/eventDeatilsPage',
  //             //       arguments: events[index].toJson());
  //             // },
  //             onTap: () {
  //               print(events[index].toJson());
  //               print('----++++++++++++++++++++++++__________');
  //               // MyEvent event = MyEvent.fromJson(events[index].toJson());
  //               Get.to(DetailPage(data: events[index].toJson()));
  //             },
  //             // Get.toNamed('/eventDetailPage' , arguments: )
  //             child: CardPopularEvent(
  //               eventModel: events[index],
  //             ),
  //           );
  //         },
  //       ),
  //     );

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
