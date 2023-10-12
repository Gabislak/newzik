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

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
      viewModelBuilder: () => BaseModel(),
      builder: (context, model, child) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Nusic',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: Text(AppLocalizations.of(context).navBar_Home,
                  style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                locator<NavigationService>().navigateTo(HomeRoute);
              },
            ),
            Divider(
              thickness: 0.5,
              // color: mediumEmphasisTextOnSurface,
            ),
            ListTile(
              leading: Icon(
                Icons.my_library_music,
                color: highEmphasisTextOnSurface,
              ),
              title: Text(
                AppLocalizations.of(context).navBar_albumList,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {
                locator<NavigationService>().navigateTo(AlbumsRoute);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.analytics,
                color: highEmphasisTextOnSurface,
              ),
              title: Text(
                AppLocalizations.of(context).navBar_stats,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {
                locator<NavigationService>().navigateTo(StatsRoute);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: highEmphasisTextOnSurface,
              ),
              title: Text(
                AppLocalizations.of(context).navBar_team,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {
                locator<NavigationService>().navigateTo(GroupeRoute);
              },
            ),
            FirebaseAuth.instance.currentUser != null
                ? ListTile(
                    hoverColor: Colors.white10,
                    leading: Icon(
                      Icons.logout,
                      color: highEmphasisTextOnSurface,
                    ),
                    title: Text(
                      AppLocalizations.of(context).navBar_logout,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () {
                      model.logOut();
                      locator<NavigationService>().navigateTo(HomeRoute);
                      final snackBar =
                          SnackBar(content: Text('Vous etes bien déco'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  )
                : ListTile(
                    leading: Icon(
                      Icons.login,
                      color: highEmphasisTextOnSurface,
                    ),
                    title: Text(
                      AppLocalizations.of(context).navBar_login,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () {
                      locator<NavigationService>().navigateTo(LoginRoute);
                    },
                  ),
            ListTile(
              leading: Icon(
                Icons.music_video,
                color: highEmphasisTextOnSurface,
              ),
              title: Text(
                AppLocalizations.of(context).navBar_gigList,
                style: Theme.of(context).textTheme.bodyMedium,
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

// class MyDrawer extends StatelessWidget {
//   const MyDrawer({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             child: Text('My App'),
//           ),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text('Home'),
//             onTap: () {
//               // Navigate to the home screen
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.album),
//             title: Text('Albums'),
//             onTap: () {
//               // Navigate to the albums screen
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.event),
//             title: Text('Gigs'),
//             onTap: () {
//               // Navigate to the gigs screen
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.language),
//             title: Text('Language'),
//             onTap: () {
//               // Navigate to the language screen
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.login),
//             title: Text('Log in'),
//             onTap: () {
//               // Navigate to the login screen
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
