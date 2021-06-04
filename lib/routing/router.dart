import 'package:flutter/material.dart';
import 'package:newzik/View/Album%20Details/album_details_view.dart';
import 'package:newzik/View/Albums/albums_view.dart';
import 'package:newzik/View/Groupe/groupe_view.dart';
import 'package:newzik/View/Stats/stats_view.dart';
import 'package:newzik/Extensions/string_extensions.dart';

import '../main.dart';
import 'route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name.getRoutingData; // Get the routing Data
  print('generateRoute: ${settings.name}');
  switch (routingData.route) {
    case HomeRoute:
      return _getPageRoute(HomeView(), settings);
    case AlbumsRoute:
      return _getPageRoute(AlbumsView(), settings);
    case AlbumDetailsRoute:
      var id = int.tryParse(routingData['id']); // Get the id from the data.
      return _getPageRoute(AlbumDetails(id: id), settings);
    case StatsRoute:
      return _getPageRoute(StatsView(), settings);
    case GroupeRoute:
      return _getPageRoute(GroupeView(), settings);
    default:
      return _getPageRoute(HomeView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
