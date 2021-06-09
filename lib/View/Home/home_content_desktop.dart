import 'package:flutter/material.dart';
import 'package:newzik/Widgets/Call%20to%20Action/call_to_action.dart';
import 'package:newzik/Widgets/centered_view.dart';
import 'package:newzik/Widgets/course_details.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenteredView(
      child: Row(
        children: <Widget>[
          CourseDetails(),
          Expanded(
            child: Center(
              child: CallToAction("ALLER À L'ALBUM DE LA SEMAINE"),
            ),
          )
        ],
      ),
    );
  }
}
