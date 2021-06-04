import 'package:flutter/material.dart';
import 'package:newzik/Services/navigation_service.dart';
import 'package:newzik/Widgets/Navigation%20Bar/navigation_bar.dart';
import 'package:newzik/Widgets/Navigation%20Drawer/navigation_drawer.dart';
import 'package:newzik/Widgets/centered_view.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:newzik/routing/route_names.dart';
import 'package:newzik/routing/router.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../locator.dart';

// class LayoutTemplate extends StatelessWidget {
//   final Widget child;
//   const LayoutTemplate({Key key, this.child}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveBuilder(
//       builder: (context, sizingInformation) => Scaffold(
//         drawer: sizingInformation.isMobile
//             ? SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.75,
//                 child: Container(
//                     decoration: BoxDecoration(color: surfaceColor),
//                     child: NavigationDrawer()))
//             : null,
//         backgroundColor: backgroundColor,
//         body: //CenteredView(
//             //child:
//             Column(
//           children: <Widget>[
//             NavigationBar(),
//             Expanded(
//               child: CenteredView(
//                 child: child,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.isMobile
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Container(
                    decoration: BoxDecoration(color: surfaceColor),
                    child: NavigationDrawer()))
            : null,
        backgroundColor: backgroundColor,
        body: //CenteredView(
            //child:
            Column(
          children: <Widget>[
            NavigationBar(),
            Expanded(
              child: Navigator(
                key: locator<NavigationService>().navigatorKey,
                onGenerateRoute: generateRoute,
                initialRoute: HomeRoute,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
