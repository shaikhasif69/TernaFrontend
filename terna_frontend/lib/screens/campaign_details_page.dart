import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:terna_frontend/utils/app_constants.dart';

class DetailPage extends StatefulWidget {
  Map data;
  DetailPage({required this.data});

  @override
  State<DetailPage> createState() => _DetailPageState(data: data);
}

class _DetailPageState extends State<DetailPage> {
  var startDate;
  Map data;
  _DetailPageState({required this.data});
  @override
  Widget build(BuildContext context) {
    // print(ModalRoute.of(context));
    print('-----++++++++++++++++++------');
    print(data);
    startDate = data['startDate'];
    print('((((((((((((((((())))))))))))))))))))');
    // print(startDate.substring(1, 3));
    print('dateeeeeeeeeeeeee');
    print(data['startDate']);

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
                  const SizedBox(height: 6),
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
              ElevatedButton(
                onPressed: () {},
                // onPressed: () => Navigator.pushNamed(
                //   context,
                //   NamedRoutes.ticketScreen,
                //   arguments: eventModel.toJson(),
                // ),
                style: ElevatedButton.styleFrom(
                    primary: AppConstants.greenColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    maximumSize: const Size(200, 150)),
                child: const Text(
                  "Register",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
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
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 191, 192, 195),
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    AppConstants.eventAttachments + data["attachment"]),
                // image: NetworkImage(
                //   data['eventImages'][0]!,
                // ),
              ),
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
