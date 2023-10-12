import 'package:flutter/material.dart';
import 'package:newzik/Widgets/Navigation%20Drawer/navigation_drawer.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'ratings_view_desktop.dart';
import 'ratings_view_mobile.dart';

class RatingsView extends StatelessWidget {
  const RatingsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Scaffold(
        appBar: AppBar(
          title: Text('Ratings'),
        ),
        drawer: MyDrawer(),
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
                        child: RatingsViewMobile(),
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
        drawer: MyDrawer(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MyDrawer(),
              ),
              Expanded(
                flex: 5,
                child: RatingsViewDesktop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}