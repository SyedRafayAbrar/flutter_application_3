import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';

class HomeCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          child: Image.asset("assets/images/nikeImage.jpg"),
        ),
        Text("Testing"),
        ElevatedButton(onPressed: () => (), child: Text("hi"))
      ],
    );
  }
}
