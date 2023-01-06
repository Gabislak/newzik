import 'package:flutter/material.dart';
import 'package:newzik/Services/navigation_service.dart';
import 'package:newzik/routing/route_names.dart';
import 'package:newzik/routing/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Managers/dialog_manager.dart';
import 'Services/dialog_service.dart';
import 'Services/navigation_service.dart';
import 'locator.dart';
import 'firebase_options.dart';
import 'constants/theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nusic',
      theme: myThemeData(),
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: HomeRoute,
    );
  }
}
