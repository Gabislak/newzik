import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/season_details_model.dart';
import 'package:newzik/View%20Models/albums_view_model.dart';
import 'package:newzik/Widgets/Album%20List/albums_list.dart';
import 'package:newzik/Widgets/Navigation%20Drawer/navigation_drawer.dart';
import 'package:newzik/Widgets/Season%20Details/season_details.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'albums_view_desktop.dart';
import 'albums_view_mobile.dart';

class AlbumsView extends StatelessWidget {
  const AlbumsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Scaffold(
        appBar: AppBar(
          title: Text('La Liste'),
        ),
        backgroundColor: backgroundColor,
        drawer: NavigationDrawer(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: AlbumsViewMobile(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      tablet: Scaffold(
        backgroundColor: backgroundColor,
        drawer: NavigationDrawer(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: NavigationDrawer(),
              ),
              Expanded(
                flex: 5,
                child: AlbumsViewDesktop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
