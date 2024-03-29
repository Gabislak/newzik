import 'package:flutter/material.dart';
import 'package:newzik/Services/navigation_service.dart';
import 'package:newzik/Styles/ui_helpers.dart';
import 'package:newzik/View%20Models/login_view_model.dart';
import 'package:newzik/Widgets/busy_button.dart';
import 'package:newzik/Widgets/input_field.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:newzik/routing/route_names.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';

class LoginViewDesktop extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 200),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      child: Image.asset('logo.png'),
                    ),
                    InputField(
                      placeholder: 'Email',
                      controller: emailController,
                    ),
                    verticalSpaceSmall,
                    InputField(
                      placeholder: 'Password',
                      password: true,
                      controller: passwordController,
                    ),
                    verticalSpaceMedium,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          mouseCursor: SystemMouseCursors.click,
                          //hoverColor: primaryColor,
                          onTap: () {
                            locator<NavigationService>().navigateTo(HomeRoute);
                          },
                          child: Text(
                            'Home Page',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        BusyButton(
                          title: 'LOGIN',
                          busy: model.busy,
                          onPressed: () {
                            model.login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          },
                        )
                      ],
                    ),
                    // verticalSpaceMedium,
                    // TextLink(
                    //   'Create an Account if you\'re new.',
                    //   onPressed: () {
                    //     // TODO: Handle navigation
                    //   },
                    // )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
