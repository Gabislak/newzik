import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/season_details_model.dart';
import 'package:newzik/Styles/text_styles.dart';
import 'package:provider_architecture/_provider_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SeasonDetailsDesktop extends ProviderWidget<SeasonDetailsModel> {
  @override
  Widget build(BuildContext context, SeasonDetailsModel details) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            details.title,
            style: titleTextStyle(sizingInformation.deviceScreenType),
          ),
          SizedBox(
            width: 50,
          ),
          Expanded(
            child: Text(
              details.description,
              style: descriptionTextStyle(sizingInformation.deviceScreenType),
            ),
          )
        ],
      ),
    );
  }
}
