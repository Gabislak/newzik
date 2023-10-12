import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/season_details_model.dart';
import 'package:newzik/View%20Models/albums_view_model.dart';
import 'package:newzik/Widgets/Album%20List/album_item.dart';
import 'package:newzik/Widgets/Album%20List/albums_list.dart';
import 'package:newzik/Widgets/Season%20Details/season_details.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AlbumsViewDesktop extends StatelessWidget {
  const AlbumsViewDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumsViewModel>.reactive(
      viewModelBuilder: () => AlbumsViewModel(),
      onModelReady: (model) => model.getAlbums(),
      builder: (context, [model, child]) => Scrollbar(
        isAlwaysShown: true,
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.10),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                SeasonDetails(
                  details: SeasonDetailsModel(
                    title: AppLocalizations.of(context).albums_Title,
                    description: AppLocalizations.of(context).albums_subTitle,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                model.albums == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : AlbumsList(albums: model.albums),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumsViewDesktop2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            SeasonDetails(
              details: SeasonDetailsModel(
                title: AppLocalizations.of(context).albums_Title,
                description: AppLocalizations.of(context).albums_subTitle,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Consumer<AlbumsViewModel>(
              builder: (context, albumList, _) {
                if (albumList.albums.isEmpty) {
                  albumList.getAlbums();
                  return Center(child: CircularProgressIndicator());
                } else {
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _getCrossAxisCount(context),
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: albumList.albums.length,
                    itemBuilder: (context, index) {
                      final album = albumList.albums[index];
                      return AlbumItem2(album: album);
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to get the number of items per row based on screen size
  int _getCrossAxisCount(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return 4;
    } else if (screenWidth > 800) {
      return 3;
    } else if (screenWidth > 600) {
      return 2;
    } else {
      return 1;
    }
  }
}
