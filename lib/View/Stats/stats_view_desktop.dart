import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:newzik/Services/db_call.dart';

class StatsViewDesktop extends StatelessWidget {
  const StatsViewDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(200),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Nusic c'est ",
              style: Theme.of(context).textTheme.headline3,
            ),
            AnimatedTextKit(animatedTexts: [
              RotateAnimatedText(
                '102 albums',
                textStyle: Theme.of(context).textTheme.headline2,
              ),
              RotateAnimatedText(
                '1190 morceaux',
                textStyle: Theme.of(context).textTheme.headline2,
              ),
              RotateAnimatedText(
                '+ de 90 heures de musique',
                textStyle: Theme.of(context).textTheme.headline2,
              ),
              RotateAnimatedText(
                '+ de 10 genres differents',
                textStyle: Theme.of(context).textTheme.headline2,
              ),
            ]),
          ],
        ),
      ),
      //child: Text('Statistiques View'),
    );
  }
}
