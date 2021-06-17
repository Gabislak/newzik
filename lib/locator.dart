import 'package:get_it/get_it.dart';

import 'Services/authentication_service.dart';
import 'Services/dialog_service.dart';
import 'Services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
}
