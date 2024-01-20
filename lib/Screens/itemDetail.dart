import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';

class ItemDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseScaffold(title: "title", body: Column(
      children: [
        Container(
          child: Image.asset("assets/images/nikeImage.jpg"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Testing Name",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text("Testing Location"),
                  ],
                ),
              ],
            ),
            Row(
              
              children: [
                const Text(
                  "Get Direction",
                  style: TextStyle(color: AppColorConstants.primaryBluecolor),
                ),
                Image.asset(
                  AppImageConstants.locationPin,
                  color: AppColorConstants.primaryBluecolor,
                  width: 20,
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ],
    )),
    );
  }
}