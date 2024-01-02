import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';
import 'package:flutter_application_3/components/primaryTextField.dart';
import 'package:flutter_application_3/components/primaryButton.dart';


class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseScaffold(
        title: "ForgotPassword",
        body: Column(
          children: [
            const PrimaryTextField(labelTextValue: "Enter Email Address", hintTextValue: "Enter Email Address/UserName"),
            const SizedBox(
              height: 20,
            ),
            Column(children: [
              PrimaryButton(title: "Submit", onPressed: () => ()),
            ]),
          ],
        ),
      ),
    );
  }
}
