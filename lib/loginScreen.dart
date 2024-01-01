import 'package:flutter/material.dart';
import 'components/counterLabel.dart';
import 'components/primaryButton.dart';
import 'components/primaryTextField.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("New")),
        body: Column(
          children: [
            const PrimaryTextField(labelTextValue: "Email"),
            const PrimaryTextField(labelTextValue: "Password"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(onPressed: () => (), child: Text("Forgot Password")),
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
    print("Button Pressed");
  }
}
