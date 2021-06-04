import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/album_item_model.dart';
import 'package:newzik/View%20Models/album_list_view_model.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

import 'album_item.dart';

class AlbumsList extends StatelessWidget {
  final List<AlbumItemModel> albums;
  AlbumsList({this.albums});
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AlbumListViewModel>.withConsumer(
      viewModelBuilder: () => AlbumListViewModel(),
      builder: (context, model, child) => Center(
        child: Wrap(
          spacing: 30,
          runSpacing: 30,
          children: <Widget>[
            ...albums
                .asMap()
                .map((index, album) => MapEntry(
                      index,
                      GestureDetector(
                        child: AlbumItem(model: album),
                        onTap: () => model.navigateToAlbum(album.idKey),
                      ),
                    ))
                .values
                .toList()
          ],
        ),
      ),
    );
  }
}
