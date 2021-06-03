import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/navbar_item_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'nav_bar_item_desktop.dart';
import 'nav_bar_item_mobile.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  final IconData icon;
  const NavBarItem(this.title, this.navigationPath, {this.icon});

  @override
  Widget build(BuildContext context) {
    var model = NavBarItemModel(
      title: title,
      navigationPath: navigationPath,
      iconData: icon,
    );
    return Provider.value(
      value: model,
      child: ScreenTypeLayout(
        tablet: NavBarItemTabletDesktop(),
        mobile: NavBarItemMobile(),
      ),
    );
  }
}
