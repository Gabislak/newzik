import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'login_view_desktop.dart';
import 'login_view_mobile.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: LoginViewMobile(),
      desktop: LoginViewDesktop(),
    );
  }
}
