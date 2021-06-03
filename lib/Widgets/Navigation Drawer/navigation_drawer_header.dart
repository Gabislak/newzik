import 'package:flutter/material.dart';
import 'package:newzik/constants/app_colors.dart';

class NavDrawerHeader extends StatelessWidget {
  const NavDrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: primaryColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "ALLER A L'ALBUM\n DE LA SEMAINE",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          Text(
            "",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
