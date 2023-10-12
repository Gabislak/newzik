import 'package:flutter/material.dart';
import 'package:newzik/Services/db_call.dart';
import 'package:newzik/Services/navigation_service.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:newzik/routing/route_names.dart';

import '../../locator.dart';

class CallToActionMobile extends StatelessWidget {
  final String title;
  const CallToActionMobile(this.title);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        getCount().then((value) {
          locator<NavigationService>().navigateTo(AlbumDetailsRoute,
              queryParams: {'id': value.toString()});
        });
      },
      child: Text(
        title,
      ),
    );
  }
}
