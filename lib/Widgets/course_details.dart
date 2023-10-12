import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var _titleTextStyle =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? Theme.of(context).textTheme.displayLarge
              : Theme.of(context).textTheme.displaySmall;

      var _bodyTextStyle =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? Theme.of(context).textTheme.bodyLarge
              : Theme.of(context).textTheme.bodySmall;

      var textAlignment =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? TextAlign.left
              : TextAlign.center;
      return Container(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).homeTitle,
              style: _titleTextStyle,
              textAlign: textAlignment,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              AppLocalizations.of(context).homeSubtitle,
              style: _bodyTextStyle,
              textAlign: textAlignment,
            )
          ],
        ),
      );
    });
  }
}
