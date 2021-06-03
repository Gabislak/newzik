import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/season_details_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'season_details_desktop.dart';
import 'season_details_mobile.dart';

class SeasonDetails extends StatelessWidget {
  final SeasonDetailsModel details;
  const SeasonDetails({Key key, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: details,
      child: ScreenTypeLayout(
        desktop: SeasonDetailsDesktop(),
        mobile: SeasonDetailsMobile(),
      ),
    );
  }
}
