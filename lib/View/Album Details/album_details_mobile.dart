import 'package:flutter/material.dart';
import 'package:newzik/View%20Models/album_detail_view_model.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:stacked/stacked.dart';

class AlbumDetailsMobile extends StatelessWidget {
  final int id;
  const AlbumDetailsMobile({Key key, this.id}) : super(key: key);

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
                  width: 250,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 250,
                        child: Stack(
                          alignment: Alignment(0.9, -0.9),
                          children: <Widget>[
                            Image.network(model.album.coverMedium,
                                fit: BoxFit.cover),
                            Material(
                              shape: CircleBorder(),
                              elevation: 20,
                              child: CircleAvatar(
                                radius: 40,
                                child: Text(
                                  '${model.album.totalRating.toStringAsFixed(1)}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.album.album,
                                style: TextStyle(fontSize: 21),
                                softWrap: true,
                              ),
                              Text(
                                'by ${model.album.artist}',
                                style: TextStyle(fontSize: 21),
                                softWrap: true,
                              ),
                              Text(
                                model.album.genre,
                                style: TextStyle(fontSize: 21),
                                softWrap: true,
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
