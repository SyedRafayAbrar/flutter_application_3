import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/app_theme.dart';
import 'package:flutter_application_3/models/appartment_model.dart';
import 'package:flutter_application_3/models/complaintModel.dart';
import 'package:flutter_application_3/models/user_model.dart';

class MyAppartmentCell extends StatelessWidget {
  AppartmentBaseModel? model;

  MyAppartmentCell({super.key,required this.model});

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
              (model?.residenceStatus ?? ''),
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
            Text(model?.appartment.unitNo ?? '', style: myTheme.textTheme.titleMedium),
            Text(model?.appartment.remainingAddress ?? '', style: myTheme.textTheme.titleSmall, softWrap: true),
          ],
        ),
      ],
    );
  }
}

