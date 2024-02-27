import 'package:flutter/material.dart';
import 'package:terna_frontend/utils/app_constants.dart';

class EventFeatureItem {
  final String name;
  final String imagePath;

  EventFeatureItem(this.name, this.imagePath);
}

var eventFeatureItems = [
  EventFeatureItem('RaktDaan!', 'assets/images/rock&concert.jpg'),
  EventFeatureItem('BJPRakt', 'assets/images/hackathon1.jpg')
];

class EventFeatureCards extends StatelessWidget {
  const EventFeatureCards(this.eventFeatureItem,
      {this.color = AppConstants.tPrimaryColor});

  final EventFeatureItem eventFeatureItem;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 105,
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppConstants.tPrimaryColor,
          ),
          color: color.withOpacity(0.25),
          borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              child: Image(
                image: AssetImage(eventFeatureItem.imagePath),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            eventFeatureItem.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
