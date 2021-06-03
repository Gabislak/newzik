import 'package:flutter/material.dart';
import 'package:newzik/View/Layout%20Template/layout_template.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:newzik/Services/navigation_service.dart';
import 'package:newzik/routing/route_names.dart';
import 'package:newzik/routing/router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Services/navigation_service.dart';
import 'View/Home/home_content_desktop.dart';
import 'View/Home/home_content_mobile.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Nusic',
//       // theme: ThemeData.dark(),
//       theme: ThemeData(
//           scrollbarTheme: ScrollbarThemeData(
//             //trackColor: MaterialStateProperty.all(surfaceColor),
//             thumbColor: MaterialStateProperty.all(primaryColor),
//             //trackBorderColor: MaterialStateProperty.all(surfaceColor),
//             isAlwaysShown: true,
//             showTrackOnHover: true,
//           ),
//           highlightColor: primaryColor,
//           primarySwatch: Colors.blue,
//           textTheme: Theme.of(context).textTheme.apply(
//               fontFamily: "Robotto",
//               bodyColor: highEmphasisTextOnSurface,
//               displayColor: highEmphasisTextOnSurface)),
//       //home: LayoutTemplate(),

//       builder: (context, child) => LayoutTemplate(
//         child: child,
//       ),
//       navigatorKey: locator<NavigationService>().navigatorKey,
//       onGenerateRoute: generateRoute,
//       initialRoute: HomeRoute,
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nusic',
      // theme: ThemeData.dark(),
      theme: ThemeData(
          scrollbarTheme: ScrollbarThemeData(
            //trackColor: MaterialStateProperty.all(surfaceColor),
            thumbColor: MaterialStateProperty.all(primaryColor),
            //trackBorderColor: MaterialStateProperty.all(surfaceColor),
            isAlwaysShown: true,
            showTrackOnHover: true,
          ),
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(
              fontFamily: "Robotto",
              bodyColor: highEmphasisTextOnSurface,
              displayColor: highEmphasisTextOnSurface)),
      home: LayoutTemplate(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeContentMobile(),
      desktop: HomeContentDesktop(),
    );
  }
}
