import 'package:flutter/material.dart';
import 'package:newzik/Styles/ui_helpers.dart';
import 'package:newzik/View%20Models/login_view_model.dart';
import 'package:newzik/Widgets/busy_button.dart';
import 'package:newzik/Widgets/input_field.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:stacked/stacked.dart';

class LoginViewMobile extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Log in'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                // ),
              ],
            ),
          )),
    );
  }
}
