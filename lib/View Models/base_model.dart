import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:newzik/Data%20Models/user_model.dart';
import 'package:newzik/Services/authentication_service.dart';
// import 'package:newzik/Services/storage_service.dart';

import '../locator.dart';

class BaseModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  // final StorageService _storageService = locator<StorageService>();

  UserModel get currentUser => _authenticationService.currentUser;

  void logOut() {
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
