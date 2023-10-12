import 'package:flutter/material.dart';
import 'package:newzik/Widgets/Call%20to%20Action/call_to_action.dart';
import 'package:newzik/Widgets/Navigation%20Drawer/navigation_drawer.dart';
import 'package:newzik/Widgets/centered_view.dart';
import 'package:newzik/Widgets/course_details.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nusic'),
      ),
      drawer: MyDrawer(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: CenteredView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CourseDetails(),
                    SizedBox(
                      height: 40,
                    ),
                    CallToAction(
                        AppLocalizations.of(context).home_CTA_albumList),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
