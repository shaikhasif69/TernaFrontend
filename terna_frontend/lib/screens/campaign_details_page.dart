import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terna_frontend/models/Campaign.dart';
import 'package:terna_frontend/services/Campaigns.dart';
import 'package:terna_frontend/utils/app_constants.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailPage extends StatefulWidget {
  Map data;
  String? userId;

  DetailPage({required this.data, required this.userId});

  @override
  State<DetailPage> createState() => _DetailPageState(data: data);
}

class _DetailPageState extends State<DetailPage> {
  // late QrCode qrCode;

  // @protected
  // late QrImage qrImage;

  var startDate;
  bool? resultValue; // Default value or whatever makes sense in your context

  Map data;
  _DetailPageState({required this.data});
  @override
  void initState() {
    super.initState();
    print("Called");

    // Call the asynchronous function in initState to ensure it is only called once
    Campaigns.checkIfAlreadyRegistered(widget.userId!, data["_id"]).then(
      (value) => setState(
        () {
          resultValue = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("this is the value : aahhhhhhhhhhhh: " + resultValue.toString());
    // print(ModalRoute.of(context));
    print('-----++++++++++++++++++------');
    print(data);
    startDate = data['startDate'];
    print('((((((((((((((((())))))))))))))))))))');
    // print(startDate.substring(1, 3));
    print('dateeeeeeeeeeeeee');
    // dynamic value = jsonDecode(data["participants"]);
    print("this the value : " + data["participants"][0]["userId"]);
    // print("this is value: " + value["userId"]);

    print("hell");

    // someFunction();
    // int resultValue =
    //     0; // Default value or whatever makes sense in your context

    // Campaigns.checkIfAlreadyRegistered(widget.userId!, data["_id"])
    //     .then((result) {
    //   resultValue = result;

    //   // Now you can use the resultValue in your conditions or wherever you need it
    //   if (resultValue == 1) {
    //     // Do something
    //     print("hurray working!");
    //     resultValue = 1;
    //   } else {
    //     // Do something else
    //     print('hurray but in sad:');
    //     resultValue = 0;
    //   }

    // Continue with the rest of your code...
    // });

    print("this is teh value: " + resultValue.toString());

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 236, 236),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                child: Column(
                  children: [
                    // _buildAppBar(context),
                    const SizedBox(height: 24),
                    _buildCardImage(data),
                    const SizedBox(height: 16),
                    _buildDescription(data),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomBar(context),
          )
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) => ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 16),
          decoration: const BoxDecoration(color: AppConstants.something),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "A motivation message here!",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppConstants.darkBlue,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        'joinUS',
                        style: TextStyle(
                          color: AppConstants.blueColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        "/Person",
                        style: TextStyle(
                            fontSize: 12, color: AppConstants.myColor),
                      )
                    ],
                  )
                ],
              ),
              resultValue != null && resultValue == true
                  ? Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants.blueColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          // maximumSize: const Size(200, 150),
                        ),
                        onPressed: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          var userId = prefs.getString("userId");
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                body: Center(
                                    child: Column(
                                  children: [
                                    QrImageView(
                                      data: userId.toString(),
                                      size: 280,
                                      embeddedImageStyle: QrEmbeddedImageStyle(
                                          // size: Size(
                                          //   100,

                                          // )
                                          // size: const Size(
                                          //   100,
                                          //   100,
                                          // ),
                                          ),
                                    )
                                  ],
                                )),
                              );
                            },
                          );
                        },
                        child: Text(
                          "Show QR",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16),
                        ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        // fetch User id from shared pref
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        var userId = prefs.getString("userId");
                        var campaignId = data["_id"];

                        bool result = await Campaigns.registerParticipants(
                            userId!, campaignId);

                        if (result == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Container(
                                height: 80,
                                child: const Text(
                                  "You have been successfully registered",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              action: SnackBarAction(
                                label: 'Okay',
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                },
                              ),
                            ),
                          );

                          Get.toNamed("/userDashboard");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstants.greenColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        // maximumSize: const Size(200, 150),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    )
            ],
          ),
        ),
      );

  Widget _buildCardImage(data) => Stack(
        children: [
          // Container(
          //   width: double.infinity,
          //   height: 280,
          //   decoration: BoxDecoration(
          //       color: AppColors.catBackgroundColor,
          //       borderRadius: BorderRadius.circular(16)),
          // ),
          Container(
            width: double.infinity,
            height: 310,
            margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
            // decoration: BoxDecoration(
            //   color: const Color.fromARGB(255, 191, 192, 195),
            //   borderRadius: BorderRadius.circular(16),
            //   image: DecorationImage(
            //     fit: BoxFit.cover,
            //     image: NetworkImage(
            //         AppConstants.eventAttachments + data["attachment"]),
            //     // image: NetworkImage(
            //     //   data['eventImages'][0]!,
            //     // ),
            //   ),
            // ),
            child: FadeInImage.memoryNetwork(
              fit: BoxFit.contain,
              width: 80,
              height: 50,
              placeholder: kTransparentImage,
              image: "${AppConstants.IP}/images/${data["attachment"]}",
            ),
          ),
          Positioned(
            right: 22,
            top: 22,
            child: Container(
              height: 65,
              width: 48,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 124, 168, 234),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(startDate.substring(5, 10)
                      // events.date.split(" ")[0],
                      ),
                  Text(
                    startDate.substring(0, 4),
                    // events.date.split(" ")[1],
                    style: const TextStyle(
                      color: AppConstants.tPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );

  // Widget _buildAppBar(BuildContext context) => Row(
  _buildDescription(data) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppConstants.extraColor2,
                      ),
                      child: Text(
                        data['title']!,
                        style: GoogleFonts.oswald(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: AppConstants.tPrimaryColor),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/search.png',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 320,
                          child: Text(
                            data['address'],
                            style: GoogleFonts.openSans(
                                color: AppConstants.tPrimaryColor,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                // Container(
                //   width: 65,
                //   height: 35,
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //     color: AppColors.buttonsColor,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: const Text(
                //     "\$100",
                //     style: TextStyle(
                //       color: AppColors.lightBackgroundColor4,
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // )
              ],
            ),
            const SizedBox(height: 16),
            // const StackParticipant(
            //   fontSize: 14,
            //   width: 30,
            //   height: 30,
            //   positionText: 100,
            // ),
            const SizedBox(height: 16),
            Text(
              "Description",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 6),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: data['description']!,
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 60, 59, 59),
                  fontSize: 14,
                  height: 1.75,
                ),
                children: const [
                  TextSpan(
                    text: "Read More...",
                    style: TextStyle(
                      color: AppConstants.tAccentColor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 64),
          ],
        ),
      );
}
