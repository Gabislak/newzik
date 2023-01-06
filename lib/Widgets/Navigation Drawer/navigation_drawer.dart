import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newzik/Services/authentication_service.dart';
import 'package:newzik/Services/navigation_service.dart';
import 'package:newzik/View%20Models/base_model.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:newzik/routing/route_names.dart';
import 'package:stacked/stacked.dart';
import '../../locator.dart';

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
                    title: Text('Home',
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
                      'La Liste',
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
                      'Statistiques',
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
                      'Le Groupe',
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
                      'Se Deconnecter',
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
                    title: Text('Home',
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
                      'La Liste',
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
                      'Statistiques',
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
                      'Le Groupe',
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
                      'Se Connecter',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onTap: () {
                      locator<NavigationService>().navigateTo(LoginRoute);
                    },
                  )
                ],
        ),
      ),
    );
  }
}
