import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/season_details_model.dart';
import 'package:newzik/View%20Models/albums_view_model.dart';
import 'package:newzik/Widgets/Album%20List/albums_list.dart';
import 'package:newzik/Widgets/Season%20Details/season_details.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:newzik/Widgets/ratings_list.dart';

class RatingsViewMobile extends StatelessWidget {
  const RatingsViewMobile({Key key}) : super(key: key);

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
                    title: 'Mes notes',
                    description: 'Utilisez cette page pour ajouter vos notes!',
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                model.albums == null
                    ? Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : RatingsList(albums: model.albums),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
