import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newzik/Data%20Models/gig_item_model.dart';
import 'package:newzik/Data%20Models/season_details_model.dart';
import 'package:newzik/Widgets/Season%20Details/season_details.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:newzik/View Models/gig_list_view_model.dart';

class GigsViewMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            SeasonDetails(
              details: SeasonDetailsModel(
                title: AppLocalizations.of(context).gigs_Title,
                description: AppLocalizations.of(context).gigs_subTitle,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Consumer<GigList>(
              builder: (context, gigList, _) {
                if (gigList.gigs.isEmpty) {
                  gigList.loadGigs();
                  return Center(
                      child: CircularProgressIndicator(
                    color: primaryColor,
                  ));
                } else {
                  return ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: gigList.gigs
                        .map((gig) => CardWidget(gig: gig))
                        .toList(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final gigModel gig;

  CardWidget({this.gig});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: surfaceColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              gig.artist,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (DateTime.parse(gig.date)
                .isAfter(DateTime.now())) // check if gig is in future
              Container(
                // create a container to hold the badge
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: primaryVariant, // set the color of the badge
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  AppLocalizations.of(context).gigs_upcoming,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16),
                SizedBox(width: 4),
                Text(
                  DateFormat('EEEE, dd MMMM yyyy')
                      .format(DateTime.parse(gig.date)),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 4),
                Text(
                  gig.venue,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Rating:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8),
                Row(
                  children: List.generate(
                    5,
                    (index) {
                      if (index < gig.rating.floor()) {
                        return Icon(Icons.star, color: Colors.amber, size: 16);
                      } else if (index == gig.rating.floor() &&
                          gig.rating % 1 != 0) {
                        return Icon(Icons.star_half,
                            color: Colors.amber, size: 16);
                      } else {
                        return Icon(Icons.star_border,
                            color: Colors.amber, size: 16);
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Tour:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              gig.tourName,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Comment:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              gig.comment,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
