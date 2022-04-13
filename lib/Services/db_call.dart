import 'dart:async';
// import 'package:firebase_db_web_unofficial/DatabaseSnapshot.dart';
// import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:newzik/Data%20Models/album_item_model.dart';
import 'package:newzik/Data%20Models/user_model.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.ref();

// Future<int> getCount() async {
//   DataSnapshot dataSnapshot = await databaseReference.child('Count').once();
//   if (dataSnapshot.value) {
//     print(dataSnapshot.value);
//     return dataSnapshot.value;
//   } else {
//     print('No data available.');
//     return null;
//   }
// }

Future<AlbumItemModel> getAlbum(int id) async {
  DataSnapshot snap =
      await databaseReference.child('Albums').child(id.toString()).get();
  AlbumItemModel alb = AlbumItemModel.fromJson(snap.value);
  return alb;
}

Future<int> getCount() async {
  DataSnapshot snap = await databaseReference.child('Count').get();
  int count = snap.value;
  print(count);
  return count;
}

Future<List<AlbumItemModel>> getAlbumList() async {
  DataSnapshot snapCount = await databaseReference.child('Count').get();
  int count = snapCount.value;
  print("number of albums: " + count.toString());
  List<AlbumItemModel> albs = [];
  for (int i = 1; i <= count; i++) {
    DataSnapshot snap =
        await databaseReference.child('Albums').child(i.toString()).get();
    AlbumItemModel alb = AlbumItemModel.fromJson(snap.value);
    print(alb.album);
    albs.add(alb);
    print(albs[i - 1].nbTracks);
  }
  print(albs.length);
  albs.sort((a, b) => b.totalRating.compareTo(a.totalRating));
  return albs;
}

Future<UserModel> getUser(String uid) async {
  DataSnapshot snap = await databaseReference.child('Members').child(uid).get();
  UserModel user = UserModel.fromJson(snap.value);
  // var avatarURL = await StorageService().getAvatarURL(user.avatar);
  // user.avatar = avatarURL;
  print(user.displayName);
  return user;
}
