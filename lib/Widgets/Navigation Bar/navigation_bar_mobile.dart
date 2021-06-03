import 'package:flutter/material.dart';
import 'package:newzik/constants/app_colors.dart';
import 'nav_bar_logo.dart';

class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: surfaceColor),
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            hoverColor: primaryColor,
            iconSize: 40,
            //tooltip: "Ouvrir le menu",
            icon: Icon(
              Icons.menu,
            ),
            color: Colors.white,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          NavBarLogo()
        ],
      ),
    );
  }
}
