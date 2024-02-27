import 'package:terna_frontend/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final String searchIcon = 'assets/images/search_icon.svg';
  String searchText = '';
  TextEditingController _searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSearching = true;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.maxFinite,
        decoration: BoxDecoration(
            border:
                Border.all(color: AppConstants.extraColor, width: 1),
            color: AppConstants.extraColor2,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // solve this error for the svg search image!
            // SvgPicture.asset(
            //   searchIcon,
            // ),
            SvgPicture.asset(searchIcon),
            // Image.asset(searchIcon,),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'your search place!',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7C7C7C),
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                    print('the value that the user typed is: ');
                    print(searchText);
                    print('-------------');
                    print(_searchController.text);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
