import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/base_scaffold.dart';
import 'package:flutter_application_3/components/primary_text_field.dart';
import 'package:flutter_application_3/components/primary_button.dart';


class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseScaffold(
        title: "ForgotPassword",
        body: Column(
          children: [
            PrimaryTextField(textEditingController: TextEditingController(),labelTextValue: "Enter Email Address", hintTextValue: "Enter Email Address/UserName"),
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
