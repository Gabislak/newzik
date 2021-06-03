import 'package:flutter/material.dart';
import 'package:newzik/Widgets/Call%20to%20Action/call_to_action.dart';
import 'package:newzik/Widgets/course_details.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CourseDetails(),
        SizedBox(
          height: 40,
        ),
        CallToAction("ALBUM DE LA SEMAINE"),
      ],
    );
  }
}
