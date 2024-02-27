import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchLocationWidget extends StatefulWidget {
  const SearchLocationWidget({Key? key}) : super(key: key);

  @override
  State<SearchLocationWidget> createState() => _SearchLocationWidgetState();
}

class _SearchLocationWidgetState extends State<SearchLocationWidget> {

  getCurrentLocation()async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
      log("Location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
    }
    else{
      Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high );
      log("Latitude = ${currentPosition.latitude.toString()}");
      log("Logitute=${currentPosition.longitude.toString()}");
      String Latitude = currentPosition.latitude.toString();
      String Longitude = currentPosition.longitude.toString();
    }
  }

  late GoogleMapController mapController;
  final LatLng _initialCenter = const LatLng(37.7749, -122.4194);
  String searchText = '';
  TextEditingController _searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialCenter,
                zoom: 12,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for a location',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Call a function to perform location search using searchText
                      // Update the map with the search results
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Get the selected location and send it to the loginUser function
                LatLng selectedLocation = LatLng(40.7128, -74.0060);
                loginUser(selectedLocation);
            },
            child: Text('Pick Location'),
          ),
        ],
      ),
    );
  }

  void loginUser(LatLng location) {
    // Implement your logic to send the selected location to the loginUser function
    print('hllo world!');
    const one = 1;
    print("below is the latlong!");
    print(LatLng);
  }
}

