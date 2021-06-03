import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/album_item_model.dart';
import 'package:newzik/Services/db_call.dart';

class AlbumsViewModel extends ChangeNotifier {
  List<AlbumItemModel> _albums;
  List<AlbumItemModel> get albums => _albums;

  bool _busy;
  bool get busy => _busy;

  String _errorMessage;
  String get errorMessage => _errorMessage;

  Future getAlbums() async {
    _setBusy(true);
    var albumsResults = await getAlbumList();

    _albums = albumsResults;
    _setBusy(false);
  }

  void _setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
