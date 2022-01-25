import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/season_details_model.dart';
import 'package:provider_architecture/_provider_widget.dart';

class SeasonDetailsDesktop extends ProviderWidget<SeasonDetailsModel> {
  @override
  Widget build(BuildContext context, SeasonDetailsModel details) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          details.title,
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          width: 50,
        ),
        Expanded(
          child: Text(
            details.description,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    );
  }
}
