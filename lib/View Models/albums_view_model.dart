import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/album_item_model.dart';
import 'package:newzik/Services/db_call.dart';
import 'package:newzik/Services/navigation_service.dart';
import 'package:newzik/routing/route_names.dart';

import '../locator.dart';

class AlbumsViewModel with ChangeNotifier {
  List<AlbumItemModel> _albums = [];
  List<AlbumItemModel> get albums => _albums;
  final NavigationService _navigationService = locator<NavigationService>();

  // bool _busy;
  // bool get busy => _busy;

  // String _errorMessage;
  // String get errorMessage => _errorMessage;

  set albums(List<AlbumItemModel> value) {
    _albums = value;
    notifyListeners();
  }

  void getAlbums() async {
    final albums = await getAlbumList();
    this.albums = albums;
    // _setBusy(true);
    // var albumsResults = await getAlbumList();

    // _albums = albumsResults;
    // _setBusy(false);
  }

  void navigateToAlbum(int index) {
    _navigationService
        .navigateTo(AlbumDetailsRoute, queryParams: {'id': index.toString()});
  }

  // void _setBusy(bool value) {
  //   _busy = value;
  //   notifyListeners();
  // }
}
