import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newzik/Services/authentication_service.dart';
import 'package:newzik/Services/navigation_service.dart';
import 'package:newzik/View%20Models/base_model.dart';
import 'package:newzik/Widgets/Navigation%20Drawer/language_listTile.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:newzik/routing/route_names.dart';
import 'package:stacked/stacked.dart';
import '../../locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newzik/Managers/locale_manager.dart';
import 'package:newzik/l10n/l10n.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
      viewModelBuilder: () => BaseModel(),
      builder: (context, model, child) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: FirebaseAuth.instance.currentUser != null
              ? // This is what the drawer looks like when somebody is authenticated
              <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: surfaceColor),
                    accountEmail: Text(
                      model.currentUser.email,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    accountName: Text(
                      model.currentUser.fullName,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(model.currentUser.avatar),
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                    color: mediumEmphasisTextOnSurface,
                  ),
                  ListTile(
                    hoverColor: Colors.white10,
                    leading: Icon(
                      Icons.home,
                      color: highEmphasisTextOnSurface,
                    ),
                    title: Text(AppLocalizations.of(context).navBar_Home,
                        style: Theme.of(context).textTheme.bodyText2),
                    onTap: () {
                      locator<NavigationService>().navigateTo(HomeRoute);
                    },
                  ),
                  Divider(
                    thickness: 0.5,
                    color: mediumEmphasisTextOnSurface,
                  ),
                  ListTile(
                    hoverColor: Colors.white10,
                    leading: Icon(
                      Icons.rate_review,
                      color: highEmphasisTextOnSurface,
                    ),
                    title: Text(
                      'Mes notes',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onTap: () {
                      locator<NavigationService>().navigateTo(RatingsRoute);
                    },
                  ),
                  Divider(
                    thickness: 0.5,
                    color: mediumEmphasisTextOnSurface,
                  ),
                  ListTile(
                    hoverColor: Colors.white10,
                    leading: Icon(
                      Icons.my_library_music,
                      color: highEmphasisTextOnSurface,
                    ),
                    title: Text(
                      AppLocalizations.of(context).navBar_albumList,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onTap: () {
                      locator<NavigationService>().navigateTo(AlbumsRoute);
                    },
                  ),
                  ListTile(
                    hoverColor: Colors.white10,
                    leading: Icon(
                      Icons.analytics,
                      color: highEmphasisTextOnSurface,
                    ),
                    title: Text(
                      AppLocalizations.of(context).navBar_stats,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onTap: () {
                      locator<NavigationService>().navigateTo(StatsRoute);
                    },
                  ),
                  ListTile(
                    hoverColor: Colors.white10,
                    leading: Icon(
                      Icons.people,
                      color: highEmphasisTextOnSurface,
                    ),
                    title: Text(
                      AppLocalizations.of(context).navBar_team,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onTap: () {
                      locator<NavigationService>().navigateTo(GroupeRoute);
                    },
                  ),
                  ListTile(
                    hoverColor: Colors.white10,
                    leading: Icon(
                      Icons.logout,
                      color: highEmphasisTextOnSurface,
                    ),
                    title: Text(
                      AppLocalizations.of(context).navBar_logout,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onTap: () {
                      model.logOut();
                      locator<NavigationService>().navigateTo(HomeRoute);
                      final snackBar =
                          SnackBar(content: Text('Vous etes bien déco'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                ]
              : // This is what the drawer looks like when there is no session
              <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Nusic',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                    color: mediumEmphasisTextOnSurface,
                  ),
                  ListTile(
                    hoverColor: Colors.white10,
                    leading: Icon(
                      Icons.home,
                      color: highEmphasisTextOnSurface,
                    ),
                    title: Text(AppLocalizations.of(context).navBar_Home,
                        style: Theme.of(context).textTheme.bodyText2),
                    onTap: () {
                      locator<NavigationService>().navigateTo(HomeRoute);
                    },
                  ),
                  Divider(
                    thickness: 0.5,
                    color: mediumEmphasisTextOnSurface,
                  ),
                  ListTile(
                    hoverColor: Colors.white10,
                    leading: Icon(
                      Icons.my_library_music,
                      color: highEmphasisTextOnSurface,
                    ),
                    title: Text(
                      AppLocalizations.of(context).navBar_albumList,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onTap: () {
                      locator<NavigationService>().navigateTo(AlbumsRoute);
                    },
                  ),
                  ListTile(
                    hoverColor: Colors.white10,
                    leading: Icon(
                      Icons.analytics,
                      color: highEmphasisTextOnSurface,
                    ),
                    title: Text(
                      AppLocalizations.of(context).navBar_stats,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onTap: () {
                      locator<NavigationService>().navigateTo(StatsRoute);
                    },
                  ),
                  ListTile(
                    hoverColor: Colors.white10,
                    leading: Icon(
                      Icons.people,
                      color: highEmphasisTextOnSurface,
                    ),
                    title: Text(
                      AppLocalizations.of(context).navBar_team,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onTap: () {
                      locator<NavigationService>().navigateTo(GroupeRoute);
                    },
                  ),
                  ListTile(
                    hoverColor: Colors.white10,
                    leading: Icon(
                      Icons.login,
                      color: highEmphasisTextOnSurface,
                    ),
                    title: Text(
                      AppLocalizations.of(context).navBar_login,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onTap: () {
                      locator<NavigationService>().navigateTo(LoginRoute);
                    },
                  ),
                  ListTile(
                    hoverColor: Colors.white10,
                    leading: Icon(
                      Icons.music_video,
                      color: highEmphasisTextOnSurface,
                    ),
                    title: Text(
                      AppLocalizations.of(context).navBar_gigList,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onTap: () {
                      locator<NavigationService>().navigateTo(GigsRoute);
                    },
                  ),
                  LanguageListTile(),
                ],
        ),
      ),
    );
  }
}
