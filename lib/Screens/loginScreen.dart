import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/appTheme.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/Helpers/networkHelper.dart';
import 'package:flutter_application_3/Helpers/secure_storage.dart';
import '/components/primaryButton.dart';
import '/components/primaryTextField.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: dashboardTheme,
      home: BaseScaffold(
        title: "Login",
        body: Column(
          children: [
            const PrimaryTextField(
                labelTextValue: "Email",
                hintTextValue: "Enter Email Address/UserName"),
            const PrimaryTextField(
                labelTextValue: "Password", hintTextValue: "Enter Password"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () => (NavigationService.navigateTo(
                        AppRoutes.forgotPW, NavigationType.push,
                        arguments: {'data': 'Hello'})),
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0)),
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(fontFamily: 'OutFit'),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(children: [
              PrimaryButton(title: "Login", onPressed: onLoginPressed),
              const SizedBox(
                height: 20,
              ),
              Text("Or"),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(title: "SignUp", onPressed: onSignUpPressed),
            ]),
          ],
        ),
      ),
    );
  }

  void onLoginPressed() async {
    NavigationService.navigateTo(
        AppRoutes.customerDashboard, NavigationType.presentRoot,
        arguments: {'data': 'Hello'});
    // SecureStorage().writeSecureData('email', "textEditingController.text");
    // var email = await SecureStorage().readSecureData('email') ?? 'No Data available';
    // logger.i('Email found $email');
  }

  void onSignUpPressed() {
    NavigationService.navigateTo(AppRoutes.signUp, NavigationType.push,
        arguments: {'data': 'Hello'});
  }
}
