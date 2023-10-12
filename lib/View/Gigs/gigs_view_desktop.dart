import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newzik/Data%20Models/gig_item_model.dart';
import 'package:newzik/Data%20Models/season_details_model.dart';
import 'package:newzik/Widgets/Season%20Details/season_details.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:newzik/View Models/gig_list_view_model.dart';
import 'package:newzik/Widgets/Gig List/gig_item.dart';

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
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: gigList.gigs
                        .map((gig) => GigCardWidget(gig: gig))
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
