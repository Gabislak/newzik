import 'package:flutter/material.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:newzik/routing/route_names.dart';
import 'nav_bar_logo.dart';
import '../NavBar Item/nav_bar_item.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(color: surfaceColor),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            NavBarLogo(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                NavBarItem('Home', HomeRoute),
                SizedBox(
                  width: 20,
                ),
                NavBarItem('La Liste', AlbumsRoute),
                SizedBox(
                  width: 20,
                ),
                NavBarItem('Stats', StatsRoute),
                SizedBox(
                  width: 20,
                ),
                NavBarItem("L' équipe", GroupeRoute),
              ],
            )
          ],
        ),
      ),
    );
  }
}
