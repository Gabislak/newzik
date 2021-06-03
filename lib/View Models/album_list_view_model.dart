import 'package:flutter/material.dart';
import 'package:newzik/Services/navigation_service.dart';
import 'package:newzik/routing/route_names.dart';

import '../locator.dart';

class AlbumListViewModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToAlbum(int index) {
    _navigationService
        .navigateTo(AlbumDetailsRoute, queryParams: {'id': index.toString()});
  }
}
