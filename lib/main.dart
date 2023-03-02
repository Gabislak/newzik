import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newzik/Managers/locale_manager.dart';
import 'package:newzik/Services/navigation_service.dart';
import 'package:newzik/routing/route_names.dart';
import 'package:newzik/routing/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Managers/dialog_manager.dart';
import 'Services/dialog_service.dart';
import 'locator.dart';
import 'firebase_options.dart';
import 'constants/theme_data.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'View Models/gig_list_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(ChangeNotifierProvider(create: (_) => GigList(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Nusic',
          theme: myThemeData(),
          locale: provider.locale,
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          builder: (context, child) => Navigator(
            key: locator<DialogService>().dialogNavigationKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => DialogManager(child: child)),
          ),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: generateRoute,
          initialRoute: HomeRoute,
        );
      },
    );
  }
}
