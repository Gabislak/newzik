import 'package:flutter/material.dart';
import 'package:newzik/View/Stats/stats_view_desktop.dart';
import 'package:newzik/View/Stats/stats_view_mobile.dart';
import 'package:newzik/Widgets/Navigation%20Drawer/navigation_drawer.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class StatsView extends StatelessWidget {
  const StatsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Scaffold(
        appBar: AppBar(
          title: Text('Stats'),
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
                        child: StatsViewMobile(),
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
                child: StatsViewDesktop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
