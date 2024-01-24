import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';
import 'package:flutter_application_3/components/cellItems/complaintsCell.dart';
import 'package:flutter_application_3/components/cellItems/homeCells.dart';
import 'package:flutter_application_3/models/complaintModel.dart';
import 'package:flutter_application_3/models/genericModel.dart';
// import 'package:flutter_application_3/components/cellItems/h';

class ComplaintsScreen extends StatelessWidget {
  List<ComplaintJsonMappable> cellModels = [];

_getJSONFromFile() async {
  final response = await rootBundle.loadString('assets/complaints.json');
  final decoded = jsonDecode(response);
  final list = (decoded['data'] as List);
  var complaintModels = list.map((data) => ComplaintJsonMappable.fromJson(data)).toList();

  cellModels = complaintModels;
}
  @override
  Widget build(BuildContext context) {
    _getJSONFromFile();
    return MaterialApp(
        home: BaseScaffold(
      shouldShowMenu: true,
      title: "Complaints",
      body: Column(children: [
        Expanded(
            child: ComplaintsListView(
          cellModels: cellModels,
        ))
      ]),
    ));
  }
}

class ComplaintsListView extends StatelessWidget {
  List<ComplaintJsonMappable> cellModels = [];
  ComplaintsListView({required this.cellModels});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => {
              NavigationService.navigateTo(
                  AppRoutes.itemDetails, NavigationType.push,
                  arguments: {'data': 'Hello'})
            },
            child: ComplaintCell(
              model: cellModels[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: cellModels.length);
  }
}
