import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newzik/Data%20Models/gig_item_model.dart';
import 'package:newzik/Data%20Models/season_details_model.dart';
import 'package:newzik/Widgets/Season%20Details/season_details.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:newzik/View Models/gig_list_view_model.dart';

class GigsViewDesktop extends StatelessWidget {
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

// TODO: Move this to its own file in widget folder

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

// TODO: Move this to its own class file in widget folder

class AddGigPanel extends StatefulWidget {
  final GigList gigList;

  AddGigPanel({this.gigList});
  @override
  _AddGigPanelState createState() => _AddGigPanelState();
}

class _AddGigPanelState extends State<AddGigPanel> {
  final _formKey = GlobalKey<FormState>();
  final _artistController = TextEditingController();
  final _commentController = TextEditingController();
  final _dateController = TextEditingController();
  final _ratingController = TextEditingController();
  final _tourNameController = TextEditingController();
  final _venueController = TextEditingController();

  @override
  void dispose() {
    _artistController.dispose();
    _commentController.dispose();
    _dateController.dispose();
    _ratingController.dispose();
    _tourNameController.dispose();
    _venueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: surfaceColor,
      width: 400,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _artistController,
              decoration: InputDecoration(labelText: 'Artist'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter an artist';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _commentController,
              decoration: InputDecoration(labelText: 'Comment'),
            ),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
              onTap: () async {
                var newDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    locale: Localizations.localeOf(context),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));

                if (newDate == null) return;
                _dateController.text = newDate.toIso8601String();
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a date';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _ratingController,
              decoration: InputDecoration(labelText: 'Rating'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _tourNameController,
              decoration: InputDecoration(labelText: 'Tour Name'),
            ),
            TextFormField(
              controller: _venueController,
              decoration: InputDecoration(labelText: 'Venue'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a venue';
                }
                return null;
              },
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              color: primaryColor,
              textColor: Colors.black,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  final newGig = gigModel(
                    artist: _artistController.text,
                    comment: _commentController.text,
                    date: _dateController.text,
                    rating: int.tryParse(_ratingController.text) ?? 0,
                    tourName: _tourNameController.text,
                    venue: _venueController.text,
                  );
                  widget.gigList.addGig(newGig);
                  Navigator.of(context).pop();
                }
              },
              child: Text('SAVE'),
            ),
          ],
        ),
      ),
    );
  }
}
