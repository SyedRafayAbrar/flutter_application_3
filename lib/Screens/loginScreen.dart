import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import '/components/primaryButton.dart';
import '/components/primaryTextField.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseScaffold(
        title: "Login",
        body: Column(
          children: [
            const PrimaryTextField(labelTextValue: "Email", hintTextValue: "Enter Email Address/UserName"),
            const PrimaryTextField(labelTextValue: "Password", hintTextValue: "Enter Password"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () => (NavigationService.navigateTo(
                        AppRoutes.forgotPW, NavigationType.push,
                        arguments: {'data': 'Hello'})),
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0)),
                    child: const Text("Forgot Password")),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(children: [
              PrimaryButton(title: "Login", onPressed: onLoginPressed),
            ]),
          ],
        ),
      ),
    );
  }

  void onLoginPressed() {
    NavigationService.navigateTo(AppRoutes.home, NavigationType.presentRoot,
        arguments: {'data': 'Hello'});
  }
}
