import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageService {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  String _avatarURL;
  String get avatarURL => _avatarURL;

  Future<String> getAvatarURL(String fileName) async {
    _avatarURL = await firebase_storage.FirebaseStorage.instance
        .ref(fileName)
        .getDownloadURL();

    return _avatarURL;

    // Within your widgets:
    // Image.network(downloadURL);
  }
}
