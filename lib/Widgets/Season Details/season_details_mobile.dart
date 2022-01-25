import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/season_details_model.dart';
import 'package:provider_architecture/_provider_widget.dart';

class SeasonDetailsMobile extends ProviderWidget<SeasonDetailsModel> {
  @override
  Widget build(BuildContext context, SeasonDetailsModel details) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          details.title,
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          details.description,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
