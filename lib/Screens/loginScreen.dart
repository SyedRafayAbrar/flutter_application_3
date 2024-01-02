import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import '/components/primaryButton.dart';
import '/components/primaryTextField.dart';
import '/Helpers/helpers.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Column(
          children: [
            const PrimaryTextField(labelTextValue: "Email"),
            const PrimaryTextField(labelTextValue: "Password"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(onPressed: () => (
                  NavigationService.navigateTo(AppRoutes.forgotPW, NavigationType.presentRoot, arguments: {'data': 'Hello'})
                ), child: const Text("Forgot Password"), style: TextButton.styleFrom(padding: EdgeInsets.fromLTRB(20, 0, 0, 0))),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(children: [
              PrimaryButton(title: "Test", onPressed: () => ()),
            ]),
          ],
        ),
      ),
    );
  }

  void onButtonPressed() {
    NavigationService.navigateTo(AppRoutes.forgotPW, NavigationType.presentRoot, arguments: {'data': 'Hello'});
    
  }
}
