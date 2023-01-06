import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/album_item_model.dart';
import 'package:newzik/View%20Models/album_list_view_model.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'Album List/album_item.dart';
import 'package:newzik/Widgets/ratings_item.dart';

class RatingsList extends StatelessWidget {
  final List<AlbumItemModel> albums;
  RatingsList({this.albums});
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AlbumListViewModel>.withConsumer(
      viewModelBuilder: () => AlbumListViewModel(),
      builder: (context, model, child) => Center(
          child: Wrap(
        children: <Widget>[
          ...albums
              .asMap()
              .map((index, album) => MapEntry(
                    index,
                    RatingItem(model: album),
                  ))
              .values
              .toList()
        ],
      )),
    );
  }
}
