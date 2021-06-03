import 'package:flutter/material.dart';
import 'package:newzik/View%20Models/album_detail_view_model.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:stacked/stacked.dart';

class AlbumDetailsDesktop extends StatelessWidget {
  final int id;
  const AlbumDetailsDesktop({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumDetailsViewModel>.reactive(
      viewModelBuilder: () => AlbumDetailsViewModel(),
      onModelReady: (model) => model.getOneAlbum(id),
      builder: (context, model, child) => Center(
        child: model.album == null
            ? CircularProgressIndicator()
            : Card(
                elevation: 20,
                color: surfaceColor,
                child: SizedBox(
                  height: 500,
                  width: 1000,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 500,
                        width: 500,
                        child: Stack(
                          alignment: Alignment(0.9, -0.9),
                          children: <Widget>[
                            Image.network(model.album.coverBig,
                                fit: BoxFit.cover),
                            Material(
                              shape: CircleBorder(),
                              elevation: 20,
                              child: CircleAvatar(
                                radius: 40,
                                child: model.album.totalRating != -1
                                    ? Text(
                                        '${model.album.totalRating.toStringAsFixed(1)}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      )
                                    : Text(
                                        '-',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                backgroundColor: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 500,
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                model.album.album,
                                style: TextStyle(
                                  color: highEmphasisTextOnSurface,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                                softWrap: true,
                              ),
                              Text(
                                'by ${model.album.artist}',
                                style: TextStyle(
                                  color: mediumEmphasisTextOnSurface,
                                  //fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                ),
                                softWrap: true,
                              ),
                              Text(
                                '${model.album.releaseDate.substring(0, 4)}',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: mediumEmphasisTextOnSurface),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
