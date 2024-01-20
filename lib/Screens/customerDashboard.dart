import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';
import 'package:flutter_application_3/components/cellItems/homeCells.dart';
// import 'package:flutter_application_3/components/cellItems/h';

class CustomerDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseScaffold(
        title: "Dashboard",
        body: Column(
          children: [
            Center(
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/nikeImage.jpg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  )),
            )
          ],
        ),
        shouldShowMenu: true,
      ),
    );
  }
}
