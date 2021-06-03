import 'package:flutter/material.dart';
import 'package:newzik/Services/navigation_service.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:newzik/routing/route_names.dart';
import '../../locator.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(color: primaryColor),
          child: Text(
            "This is the header",
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
        ListTile(
          tileColor: Colors.black,
          leading: Icon(
            Icons.home,
            color: highEmphasisTextOnSurface,
          ),
          title: Text("Home"),
          onTap: () {
            locator<NavigationService>().navigateTo(HomeRoute);
            Navigator.pop(context);
          },
        ),
        Divider(
          thickness: 0.5,
          indent: 20,
          endIndent: 20,
          color: mediumEmphasisTextOnSurface,
        ),
        ListTile(
          tileColor: Colors.black,
          leading: Icon(
            Icons.my_library_music,
            color: highEmphasisTextOnSurface,
          ),
          title: Text("La Liste"),
          onTap: () {
            locator<NavigationService>().navigateTo(AlbumsRoute);
            Navigator.pop(context);
          },
        ),
        ListTile(
          tileColor: Colors.black,
          leading: Icon(
            Icons.analytics,
            color: highEmphasisTextOnSurface,
          ),
          title: Text("Statistiques"),
          onTap: () {
            locator<NavigationService>().navigateTo(StatsRoute);
            Navigator.pop(context);
          },
        ),
        ListTile(
          tileColor: Colors.black,
          leading: Icon(
            Icons.people,
            color: highEmphasisTextOnSurface,
          ),
          title: Text("Le Groupe"),
          onTap: () {
            locator<NavigationService>().navigateTo(GroupeRoute);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
