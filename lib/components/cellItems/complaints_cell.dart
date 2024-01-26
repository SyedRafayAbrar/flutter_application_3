import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/app_theme.dart';
import 'package:flutter_application_3/models/complaintModel.dart';

class ComplaintCell extends StatelessWidget {
  ComplaintJsonMappable? model;

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
            Text(
              (model?.complaintsCurrentStatus.statusName ?? ''),
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
            Text(model?.complaintsSubject ?? '', style: myTheme.textTheme.titleMedium),
            Text(model?.complaintsBody ?? '', style: myTheme.textTheme.titleSmall, softWrap: true),
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
