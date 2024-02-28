import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:terna_frontend/services/Patients.dart';
import 'package:terna_frontend/utils/app_constants.dart';

class AskForHelpPage extends StatefulWidget {
  const AskForHelpPage({super.key});

  @override
  State<AskForHelpPage> createState() => _AskForHelpPageState();
}

class _AskForHelpPageState extends State<AskForHelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.themeColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Need a blood?"),
                      content: const Text("Press OK to continue."),
                      actions: [
                        ElevatedButton(
                          onPressed: () async {
                            bool isReady = await Patients.sendNoti();

                            if (isReady == true) {
                              Fluttertoast.showToast(
                                msg: "Your request has been processed",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }

                            Future.delayed(Duration(seconds: 2));

                            Get.toNamed("/");
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
              // tooltip: 'Emergency',
              child: const Text("Press here in urgency"),
              // backgroundColor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
