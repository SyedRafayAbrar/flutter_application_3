import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/my_appartment_state.dart';
import 'package:flutter_application_3/Helpers/network_helper.dart';
import 'package:flutter_application_3/Helpers/request_handler.dart';
import 'package:flutter_application_3/Helpers/stateHandlers.dart';
import 'package:flutter_application_3/Screens/create_complaint.dart';
import 'package:flutter_application_3/components/cellItems/my_appartment_cell.dart';
import 'package:flutter_application_3/models/genericModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/Screens/base_scaffold.dart';
import 'package:flutter_application_3/components/cellItems/complaints_cell.dart';
import 'package:flutter_application_3/models/complaintModel.dart';
// import 'package:flutter_application_3/components/cellItems/h';

class MyAppartments extends StatefulWidget {
  @override
  State<MyAppartments> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<MyAppartments> {
  List<ComplaintJsonMappable> cellModels = [];

  Future<void> _getComplaints() async {
    try {
      var apiHandler = RequestHandler();
      var complaintModels = await apiHandler.getComplaints();

      if (complaintModels != null) {
        setState(() {
          cellModels = complaintModels.data;
        });
        
      } else {
        // Handle null response
        // You might want to show an error message to the user
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
      // Show an alert or handle the error in a way suitable for your app
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getComplaints();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BaseScaffold(
      title: "My Appartments",
      body: Column(children: [
        Expanded(
            child: AppartmentListView())
      ]),
    ));
  }
}

class AppartmentListView extends ConsumerWidget {
  AppartmentListView(){
    logger.i('ComplaintsListView initializes');
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appartments = ref.watch(appartmentProvider);
    return ListView.separated(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => {
              NavigationService.navigateTo(
                  AppRoutes.itemDetails, NavigationType.push,
                  arguments: {'data': 'Hello'})
            },
            child: MyAppartmentCell(
              model: appartments?[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: appartments?.length ?? 0);
  }
}
