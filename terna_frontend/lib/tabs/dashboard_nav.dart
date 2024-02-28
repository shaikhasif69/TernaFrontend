import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:terna_frontend/screens/profile_screen.dart';
import "package:terna_frontend/screens/AskForHelp.dart";

import '../screens/home_screen.dart';
import 'search_page.dart';

class UserDashBoard extends StatefulWidget {
  const UserDashBoard({super.key});

  @override
  State<UserDashBoard> createState() => _UserDashBoardState();
}

class _UserDashBoardState extends State<UserDashBoard> {
  int _currentIndex = 0;
  final tabs = [
    HomeScreen(),
    AskForHelpPage(),
    SearchPage(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: "Ask for help",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "More",
          ),
        ],
      ),
      //give the navbar on specific page itself.
      // appBar: AppBar(
      //   title: const Text(
      //     "Eventia",
      //     style: const TextStyle(
      //         fontFamily: 'Specimen',
      //         fontWeight: FontWeight.bold,
      //         color: Colors.white),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.black,
      //   toolbarHeight: 70,
      //   automaticallyImplyLeading: false,
      // ),
      body: tabs[_currentIndex],
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Container(
      //       child: Center(child: Text('This s a homepage of a user! ')),
      //     )
      //   ],
      // ),
    );
  }
}
