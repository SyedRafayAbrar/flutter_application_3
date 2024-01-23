import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';
import 'package:flutter_application_3/components/cellItems/complaintsCell.dart';
import 'package:flutter_application_3/components/cellItems/homeCells.dart';
// import 'package:flutter_application_3/components/cellItems/h';

class ComplaintsScreen extends StatelessWidget {
  List<ComplaintCellModel> cellModels = [
    ComplaintCellModel(
        titleValue: "Testing comp 1",
        descriptionValue:
            "Water is not getting filled in tank, My flat is 206 please take an action"),
    ComplaintCellModel(
        titleValue: "Testing comp 2",
        descriptionValue:
            "Water is not getting filled in tank, My flat is 206 please take an action"),
    ComplaintCellModel(
        titleValue: "Testing comp 3",
        descriptionValue:
            "Water is not getting filled in tank, My flat is 206 please take an action")
  ];

  @override
  Widget build(BuildContext context) {
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
  List<ComplaintCellModel> cellModels = [];
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
