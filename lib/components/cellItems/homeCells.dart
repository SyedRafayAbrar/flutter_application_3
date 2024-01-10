import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/constants.dart';

class HomeCell extends StatelessWidget {
  // final HomeCellModel? model = null;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.asset("assets/images/nikeImage.jpg"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              
              children: [
                Column(
                  children: [
                    Text(
                      "Testing Name",
                      textAlign: TextAlign.left,
                      style: TextStyle(backgroundColor: Colors.amber),
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
    );
  }
}

class HomeCellModel {
  final int id = -1;
  final String nameValue = "";
  final String locationValue = "";
  final String distanceValue = "";
}
