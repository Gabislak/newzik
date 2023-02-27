import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      TextStyle _titleTextStyle =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? Theme.of(context).textTheme.headline1
              : Theme.of(context).textTheme.headline3;

      TextStyle _bodyTextStyle =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? Theme.of(context).textTheme.bodyText1
              : Theme.of(context).textTheme.bodyText2;

      var textAlignment =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? TextAlign.left
              : TextAlign.center;

      double titleSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 50
              : 80;
      double descriptionSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 16
              : 21;
      return Container(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // AnimatedTextKit(animatedTexts: [
            //   TypewriterAnimatedText(
            //     'Nusic. \nNew Music Every Week',
            //     textStyle: _titleTextStyle,
            //     speed: Duration(milliseconds: 200),
            //   ),
            // ]),
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
