import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/navbar_item_model.dart';
import 'package:newzik/Services/navigation_service.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';

class NavBarItemTabletDesktop extends ViewModelWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return MaterialButton(
      textColor: highEmphasisTextOnSurface,
      hoverElevation: 20,
      hoverColor: surfaceColor,
      mouseCursor: SystemMouseCursors.click,
      onPressed: () {
        locator<NavigationService>().navigateTo(model.navigationPath);
      },
      child: Text(
        model.title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
