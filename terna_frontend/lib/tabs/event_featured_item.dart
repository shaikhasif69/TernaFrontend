import 'package:flutter/material.dart';
import 'package:terna_frontend/utils/app_constants.dart';

// class EventFeatureItem {
//   final String name;
//   final String desc;
//   final String imagePath;

//   EventFeatureItem(this.name, this.desc, this.imagePath);
// }

class EventFeatureCards extends StatelessWidget {
  const EventFeatureCards(this.eventFeatureItem,
      {this.color = AppConstants.tPrimaryColor});

  final eventFeatureItem;
  final Color color;

  @override
  Widget build(BuildContext context) {
    print("eventFeatureItem");
    print(eventFeatureItem);

    return Container(
      width: 240,
      height: 105,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
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
                image: AssetImage(eventFeatureItem["attachment"]),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            eventFeatureItem["title"],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
