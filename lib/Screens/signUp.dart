import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import '/components/primaryButton.dart';
import '/components/primaryTextField.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseScaffold(
        title: "Sign Up",
        body: Column(
          children: [
            const PrimaryTextField(labelTextValue: "UserName", hintTextValue: "Enter UserName"),
            const PrimaryTextField(labelTextValue: "Email", hintTextValue: "Enter Email Address"),
            const PrimaryTextField(labelTextValue: "Password", hintTextValue: "Enter Password"),
            const SizedBox(
              height: 20,
            ),
            Column(children: [
              PrimaryButton(title: "SignUp", onPressed: onLoginPressed),
            ]),
          ],
        ),
        shouldShowMenu: false,
      ),
    );
  }

  void onLoginPressed() {
    NavigationService.navigateTo(AppRoutes.home, NavigationType.push,
        arguments: {'data': 'Hello'});
  }
}
