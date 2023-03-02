import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/gig_item_model.dart';
import 'package:newzik/Services/db_call.dart';

class GigList with ChangeNotifier {
  List<gigModel> _gigs = [];

  List<gigModel> get gigs => _gigs;

  set gigs(List<gigModel> value) {
    _gigs = value;
    notifyListeners();
  }

  void loadGigs() async {
    final gigs = await getGigs();
    this.gigs = gigs;
  }

  void addGig(gigModel gig) async {
    final newGigRef =
        databaseReference.child('Gigs').child((gigs.length + 1).toString());
    await newGigRef.set(gig.toJson());
    gigs.add(gig);
    gigs.sort((a, b) => b.date.compareTo(a.date));
    await databaseReference.child('Gigs_Count').set(gigs.length);
    notifyListeners();
  }
}
