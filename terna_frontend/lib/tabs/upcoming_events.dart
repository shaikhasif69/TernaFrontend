import 'package:flutter/material.dart';
import 'package:terna_frontend/utils/app_constants.dart';

class UpComingEvents extends StatefulWidget {
  final String eventName;
  final String eventSubTitle;
  final String eventImage;
  final int eventStartDate;

  UpComingEvents({
    required this.eventName,
    required this.eventSubTitle,
    required this.eventImage,
    required this.eventStartDate,
  });

  @override
  State<UpComingEvents> createState() => _UpComingEventsState();
}

class _UpComingEventsState extends State<UpComingEvents> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        // padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppConstants.myColor,
            border: Border.all(color: AppConstants.extraColor),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 110,
                    padding: EdgeInsets.all(8),
                    height: 120,
                    // color: Colors.grey[300],
                    child: Image.asset(widget.eventImage),
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      widget.eventSubTitle,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                    Text(widget.eventName),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(child: Text(widget.eventStartDate.toString())),
            ),
          ],
        ),
      ),
    );
  }
}
