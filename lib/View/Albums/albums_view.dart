import 'package:flutter/material.dart';
import 'package:newzik/Widgets/Navigation%20Drawer/navigation_drawer.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'albums_view_desktop.dart';
import 'albums_view_mobile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlbumsView extends StatelessWidget {
  const AlbumsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).albums_Title),
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
