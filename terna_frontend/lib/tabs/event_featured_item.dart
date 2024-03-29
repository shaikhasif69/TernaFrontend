import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:terna_frontend/utils/app_constants.dart';
import 'package:transparent_image/transparent_image.dart';

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
      width: 260,
      height: 105,
      margin: EdgeInsets.only(left: 20),
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
              child: FadeInImage.memoryNetwork(
                fit: BoxFit.cover,
                width: 80,
                height: 80,
                placeholder: kTransparentImage,
                image:
                    "${AppConstants.IP}/images/${eventFeatureItem["attachment"]}",
              ),
            ),
          ),
          // ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventFeatureItem["title"],
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  eventFeatureItem["description"],
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
