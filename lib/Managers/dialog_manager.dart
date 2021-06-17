import 'package:flutter/material.dart';
import 'package:newzik/Data%20Models/dialog_model.dart';
import 'package:newzik/Services/dialog_service.dart';
import 'package:newzik/constants/app_colors.dart';

import '../locator.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(DialogRequest request) {
    var isConfirmationDialog = request.cancelTitle != null;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: surfaceColor,
              title: Text(
                request.title,
                style: TextStyle(color: highEmphasisTextOnSurface),
              ),
              content: Text(
                request.description,
                style: TextStyle(color: highEmphasisTextOnSurface),
              ),
              actions: <Widget>[
                if (isConfirmationDialog)
                  TextButton(
                    onPressed: () {
                      _dialogService
                          .dialogComplete(DialogResponse(confirmed: false));
                    },
                    child: Text(request.cancelTitle),
                  ),
                TextButton(
                  onPressed: () {
                    _dialogService
                        .dialogComplete(DialogResponse(confirmed: true));
                  },
                  child: Text(request.buttonTitle),
                ),
              ],
            ));
  }
}
