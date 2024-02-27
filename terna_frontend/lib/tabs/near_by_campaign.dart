// import 'package:eventia/AppConstants/appColor.dart';
// import 'package:eventia/AppConstants/constants.dart';
// import 'package:flutter/material.dart';

// import '../../models/event.dart';

// class CardPopularEvent extends StatelessWidget {
//   final MyEvent eventModel;

//   const CardPopularEvent({required MyEvent this.eventModel, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 250,
//       height: 270,
//       margin: const EdgeInsets.only(left: 8, right: 8),
//       child: Stack(
//         children: [
//           _buildCardImage(),
//           _buildCardDesc(),
//         ],
//       ),
//     );
//   }

//   _buildCardImage() => Container(
//         width: 250,
//         height: 250,
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: AppColors.lightBackgroundColor,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Stack(
//             children: [
//               Image.network(
//                   Constants.eventAttachments + eventModel.eventImages![0]),
//               Positioned(
//                 right: 8,
//                 top: 8,
//                 child: Container(
//                   height: 50,
//                   width: 35,
//                   decoration: BoxDecoration(
//                     color: AppColors.lightBackgroundColor3,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         // eventModel.eventStartDate!.toString(),
//                         "12",
//                         // eventModel.eventStartDate!,
//                       ),
//                       Text(
//                         "Dec",
//                         // eventModel.eventEndDate.toString(),
//                         style: const TextStyle(
//                           color: AppColors.darkTextColor2,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       );

//   _buildCardDesc() => Positioned(
//         bottom: 0,
//         right: 0,
//         left: 0,
//         child: Container(
//           height: 60,
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           margin: const EdgeInsets.symmetric(horizontal: 18),
//           decoration: BoxDecoration(
//               color: AppColors.lightBackgroundColor4,
//               borderRadius: BorderRadius.circular(12)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     eventModel.eventName!,
//                     style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.darkTextColor1),
//                   ),
//                   // const SizedBox(height: 6),
//                   Row(
//                     children: [
//                       // Image.asset('assets/images/search.png', width: 14),
//                       Icon(
//                         Icons.location_on,
//                         size: 22,
//                       ),
//                       const SizedBox(width: 4),
//                       Container(
//                         width: 130,
//                         child: Text(
//                           // eventModel.eventLocation.toString(),
//                           eventModel.eventLocation!['address'],
//                           overflow: TextOverflow.ellipsis,

//                           style: const TextStyle(
//                             fontSize: 12,
//                             color: AppColors.darkTextColor2,
//                           ),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//               Container(
//                   width: 30,
//                   height: 50,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Icon(Icons.sell))
//             ],
//           ),
//         ),
//       );
// }
