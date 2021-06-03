import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/album_item_model.dart';
import 'package:newzik/constants/app_colors.dart';

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
                      child: model.totalRating != -1
                          ? Text(
                              '${model.totalRating.toStringAsFixed(1)}',
                              style: TextStyle(color: Colors.black),
                            )
                          : Text(
                              '-',
                              style: TextStyle(color: Colors.black),
                            ),
                      backgroundColor: secondaryColor,
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
                      style: TextStyle(
                        color: highEmphasisTextOnSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                      softWrap: true,
                    ),
                    Text(
                      'by ${model.artist}',
                      style: TextStyle(
                        color: mediumEmphasisTextOnSurface,
                        //fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                      softWrap: true,
                    ),
                    Text(
                      '${model.releaseDate.substring(0, 4)}',
                      style: TextStyle(
                          fontSize: 13, color: mediumEmphasisTextOnSurface),
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
