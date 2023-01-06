import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/album_item_model.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RatingItem extends StatelessWidget {
  final AlbumItemModel model;
  const RatingItem({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          model.album,
          style: Theme.of(context).textTheme.headline6,
          softWrap: true,
        ),
        Text(
          'by ${model.artist}',
          style: Theme.of(context).textTheme.subtitle1,
          softWrap: true,
        ),
        Text(
          '${model.releaseDate.substring(0, 4)}',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          FirebaseAuth.instance.currentUser.displayName,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
