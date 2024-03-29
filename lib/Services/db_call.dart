import 'dart:async';
import 'package:newzik/Data%20Models/album_item_model.dart';
import 'package:newzik/Data%20Models/gig_item_model.dart';
import 'package:newzik/Data%20Models/user_model.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.ref();

Future<AlbumItemModel> getAlbum(int id) async {
  DataSnapshot snap =
      await databaseReference.child('Albums').child(id.toString()).get();
  AlbumItemModel alb = AlbumItemModel.fromJson(snap.value);
  return alb;
}

Future<int> getCount() async {
  DataSnapshot snap = await databaseReference.child('Count').get();
  int count = snap.value;
  //print(count);
  return count;
}

Future<int> getGenreCount(String genre) async {
  DataSnapshot snap =
      await databaseReference.child('Genres').child(genre).child('count').get();
  int count = snap.value;
  //print(count);
  return count;
}

Future<List<AlbumItemModel>> getAlbumList() async {
  DataSnapshot snapCount = await databaseReference.child('Count').get();
  int count = snapCount.value;
  print('number of albums: ' + count.toString());
  List<AlbumItemModel> albs = [];
  for (int i = 1; i <= count; i++) {
    DataSnapshot snap =
        await databaseReference.child('Albums').child(i.toString()).get();
    AlbumItemModel alb = AlbumItemModel.fromJson(snap.value);
    //print(alb.album);
    albs.add(alb);
    //print(albs[i - 1].nbTracks);
  }
  //print(albs.length);
  albs.sort((a, b) => b.totalRating.compareTo(a.totalRating));
  return albs;
}

Future<UserModel> getUser(String uid) async {
  DataSnapshot snap = await databaseReference.child('Members').child(uid).get();
  UserModel user = UserModel.fromJson(snap.value);
  //print(user.displayName);
  print(user.ratings);
  return user;
}

/// Retrieves a list of gigs from the Firebase Realtime Database and returns it as a List of [gigModel] objects.
///
/// Returns an empty list if no gigs are found.
///
/// The returned list is sorted by date, with the most recent gig first.
Future<List<gigModel>> getGigs() async {
  DataSnapshot snapCount = await databaseReference.child('Gigs_Count').get();
  int count = snapCount.value;
  print('number of gigs: ' + count.toString());
  List<gigModel> gigs = [];
  for (int i = 1; i <= count; i++) {
    DataSnapshot snap =
        await databaseReference.child('Gigs').child(i.toString()).get();
    gigModel gig = gigModel.fromJson(snap.value);
    gigs.add(gig);
  }
  gigs.sort((a, b) => b.date.compareTo(a.date));

  return gigs;
}
