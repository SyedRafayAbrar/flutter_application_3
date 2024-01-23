import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/appTheme.dart';

class ComplaintCell extends StatelessWidget {
  ComplaintCellModel? model;

  ComplaintCell({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Status",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            Text(model?.titleValue ?? '', style: myTheme.textTheme.titleMedium),
            Text(model?.descriptionValue ?? '', style: myTheme.textTheme.titleSmall, softWrap: true),
          ],
        ),
      ],
    );
  }
}

class ComplaintCellModel {
  final int id = -1;
  String titleValue = "";
  String descriptionValue = "";

  ComplaintCellModel({required this.titleValue, required this.descriptionValue});
}
