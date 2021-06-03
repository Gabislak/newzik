import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/season_details_model.dart';
import 'package:newzik/Styles/text_styles.dart';
import 'package:provider_architecture/_provider_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SeasonDetailsMobile extends ProviderWidget<SeasonDetailsModel> {
  @override
  Widget build(BuildContext context, SeasonDetailsModel details) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Column(
        children: <Widget>[
          Text(
            details.title,
            style: titleTextStyle(sizingInformation.deviceScreenType),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            details.description,
            style: descriptionTextStyle(sizingInformation.deviceScreenType),
          ),
        ],
      ),
    );
  }
}
