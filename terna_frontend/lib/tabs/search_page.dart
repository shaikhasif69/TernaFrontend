import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terna_frontend/screens/campaign_details_page.dart';
import 'package:terna_frontend/services/Campaigns.dart';
import 'package:terna_frontend/tabs/event_featured_item.dart';
import 'package:terna_frontend/utils/app_constants.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  late Future<dynamic> searchResults;

  @override
  void initState() {
    super.initState();
    // Initialize searchResults here
    searchResults = Future.value(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Search",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30,
                            child: Image.asset(
                              'assets/images/search.png',
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Campaigns to join?'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          // Trigger the search when the search icon is clicked
                          searchResults =
                              Campaigns.getSearchResults(searchController.text);
                        });
                      },
                      icon: Icon(Icons.search),
                    ),
                  ),
                )
              ],
            ),
          ),

          // Search Appears here
          FutureBuilder(
            future: searchResults,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
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
                    return GestureDetector(
                      onTap: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        String? userId = prefs.getString("userId");
                        print(userId);

                        Get.to(
                          DetailPage(
                              data: snapshot.data[index], userId: userId!),
                        );
                      },
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
                  children: [
                    Text(
                      "No data found",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                );
              }
            },
          )
        ],
      ),
    );
  }
}
