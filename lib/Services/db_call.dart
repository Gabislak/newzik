import 'dart:async';
import 'package:firebase_db_web_unofficial/DatabaseSnapshot.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:newzik/Data%20Models/album_item_model.dart';

Future<AlbumItemModel> getAlbum(int id) async {
  DatabaseSnapshot snap = await FirebaseDatabaseWeb.instance
      .reference()
      .child("Albums")
      .child(id.toString())
      .once();
  AlbumItemModel alb = AlbumItemModel.fromJson(snap.value);
  return alb;
}

Future<int> getCount() async {
  DatabaseSnapshot snap =
      await FirebaseDatabaseWeb.instance.reference().child("Count").once();
  int count = snap.value;
  print(count);
  return count;
}

Future<List<AlbumItemModel>> getAlbumList() async {
  DatabaseSnapshot snapCount =
      await FirebaseDatabaseWeb.instance.reference().child('Count').once();
  int count = snapCount.value;
  // print("number of albums: " + count.toString());
  List<AlbumItemModel> albs = [];
  for (int i = 1; i <= count; i++) {
    DatabaseSnapshot snap = await FirebaseDatabaseWeb.instance
        .reference()
        .child("Albums")
        .child(i.toString())
        .once();
    AlbumItemModel alb = AlbumItemModel.fromJson(snap.value);
    // print(alb.album);
    albs.add(alb);
    // print(albs[i - 1].nbTracks);
  }
  // print(albs.length);
  albs.sort((a, b) => b.totalRating.compareTo(a.totalRating));
  return albs;
}
