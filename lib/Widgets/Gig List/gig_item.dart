import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newzik/Data Models/gig_item_model.dart';

// class GigCardWidget extends StatelessWidget {
//   final gigModel gig;

//   GigCardWidget({this.gig});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: surfaceColor,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               gig.artist,
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             if (DateTime.parse(gig.date)
//                 .isAfter(DateTime.now())) // check if gig is in future
//               Container(
//                 // create a container to hold the badge
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                 decoration: BoxDecoration(
//                   color: primaryVariant, // set the color of the badge
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Text(
//                   AppLocalizations.of(context).gigs_upcoming,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             SizedBox(height: 8),
//             Row(
//               children: [
//                 Icon(Icons.calendar_today, size: 16),
//                 SizedBox(width: 4),
//                 Text(
//                   DateFormat('EEEE, dd MMMM yyyy')
//                       .format(DateTime.parse(gig.date)),
//                   style: Theme.of(context).textTheme.headline6,
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             Row(
//               children: [
//                 Icon(Icons.location_on, size: 16),
//                 SizedBox(width: 4),
//                 Text(
//                   gig.venue,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text(
//                   'Rating:',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Row(
//                   children: List.generate(
//                     5,
//                     (index) {
//                       if (index < gig.rating.floor()) {
//                         return Icon(Icons.star, color: Colors.amber, size: 16);
//                       } else if (index == gig.rating.floor() &&
//                           gig.rating % 1 != 0) {
//                         return Icon(Icons.star_half,
//                             color: Colors.amber, size: 16);
//                       } else {
//                         return Icon(Icons.star_border,
//                             color: Colors.amber, size: 16);
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Tour:',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               gig.tourName,
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Comment:',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               gig.comment,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class GigCardWidget extends StatefulWidget {
  final gigModel gig;

  GigCardWidget({this.gig});

  @override
  _GigCardWidgetState createState() => _GigCardWidgetState();
}

class _GigCardWidgetState extends State<GigCardWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.gig.artist,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Icon(Icons.calendar_today, size: 16),
                          SizedBox(width: 4),
                          Text(
                            DateFormat('EEEE, dd MMMM yyyy')
                                .format(DateTime.parse(widget.gig.date)),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.location_on, size: 16),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              widget.gig.venue,
                              style: Theme.of(context).textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                IconButton(
                  icon:
                      Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
              ],
            ),
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Rating:',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(width: 8),
                      Row(
                        children: List.generate(
                          5,
                          (index) {
                            if (index < widget.gig.rating.floor()) {
                              return Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              );
                            } else if (index == widget.gig.rating.floor() &&
                                widget.gig.rating % 1 != 0) {
                              return Icon(
                                Icons.star_half,
                                color: Colors.amber,
                                size: 16,
                              );
                            } else {
                              return Icon(
                                Icons.star_border,
                                color: Colors.amber,
                                size: 16,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Tour:',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.gig.tourName,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Comment:',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.gig.comment,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
