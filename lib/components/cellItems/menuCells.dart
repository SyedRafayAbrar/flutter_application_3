import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/constants.dart';

class MenuCell extends StatelessWidget {
  MenuCellModel model;

MenuCell({required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        model.menuIcon,
        SizedBox(width: 10,), 
        Text(model.menuTitle)],
    );
  }
}

class MenuCellModel {

  MenuCellModel({required this.menuTitle, required this.menuIcon});
  
  String menuTitle = "";
  Icon menuIcon = Icon(null);
}