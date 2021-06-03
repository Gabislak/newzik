import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/album_item_model.dart';
import 'package:newzik/Services/db_call.dart';

class AlbumDetailsViewModel extends ChangeNotifier {
  AlbumItemModel _album;
  AlbumItemModel get album => _album;

  bool _busy;
  bool get busy => _busy;

  String _errorMessage;
  String get errorMessage => _errorMessage;

  Future getOneAlbum(int id) async {
    _setBusy(true);
    var albumResult = await getAlbum(id);

    _album = albumResult;
    _setBusy(false);
  }

  void _setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
