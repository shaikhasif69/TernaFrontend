import 'package:flutter/material.dart';
import 'package:terna_frontend/utils/app_constants.dart';

class MyAppBanner extends StatelessWidget {
  const MyAppBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.8,
      width: 500,
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage(
                'assets/images/blood.jpg',
              ),
              fit: BoxFit.cover)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //   child: Image.asset('assets/cat1.png'),
          // ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'AarogyaRakt... ! Donate !',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                'Dont miss a chance.. Donate!',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppConstants.tPrimaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
