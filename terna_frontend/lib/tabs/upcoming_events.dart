import 'package:flutter/material.dart';
import 'package:terna_frontend/utils/app_constants.dart';
import 'package:transparent_image/transparent_image.dart';

class UpComingEvents extends StatefulWidget {
  final String eventName;
  final String eventSubTitle;
  final String eventImage;
  final String eventStartDate;

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
                    padding: EdgeInsets.all(14),
                    height: 120,
                    child: FadeInImage.memoryNetwork(
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                      placeholder: kTransparentImage,
                      image: "${AppConstants.IP}/images/${widget.eventImage}",
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.eventName,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      width: 180,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        widget.eventSubTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ),
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
