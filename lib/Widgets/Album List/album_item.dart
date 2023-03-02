import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/album_item_model.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlbumItem extends StatelessWidget {
  final AlbumItemModel model;
  const AlbumItem({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      child: Card(
        color: surfaceColor,
        elevation: 20,
        child: SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 250,
                child: Stack(
                  alignment: Alignment(0.95, 1.2),
                  children: <Widget>[
                    Image.network(
                      model.coverMedium,
                      fit: BoxFit.cover,
                    ),
                    CircleAvatar(
                      backgroundColor: secondaryColor,
                      child: model.totalRating != -1
                          ? Text(
                              '${model.totalRating.toStringAsFixed(1)}',
                              style: Theme.of(context).textTheme.button,
                            )
                          : Text(
                              '-',
                              style: Theme.of(context).textTheme.button,
                            ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      model.album,
                      style: Theme.of(context).textTheme.headline6,
                      softWrap: true,
                    ),
                    Text(
                      model.artist,
                      style: Theme.of(context).textTheme.subtitle1,
                      softWrap: true,
                    ),
                    Text(
                      '${model.releaseDate.substring(0, 4)}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
