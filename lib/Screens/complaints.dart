import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';
import 'package:flutter_application_3/components/cellItems/homeCells.dart';
// import 'package:flutter_application_3/components/cellItems/h';

class ComplaintsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseScaffold(
        shouldShowMenu: true,
        title: "Complaints",
        body: Center(child: Text("Complaints")),
      )
    );
  }
}