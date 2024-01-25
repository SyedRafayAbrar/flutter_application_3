import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/networkHelper.dart';
import 'package:flutter_application_3/models/genericModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';
import 'package:flutter_application_3/components/cellItems/complaintsCell.dart';
import 'package:flutter_application_3/models/complaintModel.dart';
// import 'package:flutter_application_3/components/cellItems/h';

class ComplaintsScreen extends StatefulWidget {
  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  List<ComplaintJsonMappable> cellModels = [];

  // _getComplaints() {
    // final response = await rootBundle.loadString('assets/complaints.json');
    // final decoded = jsonDecode(response);
    // final list = (decoded['data'] as List);
    // var complaintModels = list.map((data) => ComplaintJsonMappable.fromJson(data)).toList();
    // Map<String, String> requestHeaders = {
    //   'Content-type': 'application/json',
    //   'Accept': 'application/json',
    //   'Authorization': 'token 3cf2a2f3c0bbef0b8e3bc18262c30598eb89a1be'
    // };

    // var url = Uri.http('127.0.0.1:8000', '/api/get_complaints');
    // var response = await http.get(url, headers: requestHeaders);
    // if (response.statusCode == 200) {
    //   final decoded = jsonDecode(response.body);
    //   final list = (decoded['data'] as List);
    //   var complaintModels =
    //       list.map((data) => ComplaintJsonMappable.fromJson(data)).toList();
    //   setState(() {
    //     cellModels = complaintModels;
    //   });
    // }

  //   return FutureBuilder(
  //       future: NetworkHelper().getData(EndPointTypes.getComplaints),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           final list = (snapshot.data['data'] as List);
  //           var complaintModels = list
  //               .map((data) => ComplaintJsonMappable.fromJson(data))
  //               .toList();
  //           setState(() {
  //             cellModels = complaintModels;
  //           });
  //         }
  //         return CircularProgressIndicator();
  //       });
  // }

  Future<void> _getComplaints() async {
    try {
      // Example: Fetch data for a specific endpoint
      var endpoint = EndPointTypes.getComplaints;
      var responseData = await NetworkHelper().getData(endpoint: endpoint);

      // Process the responseData as needed
      //  final list = (responseData['data'] as List);
      var complaintModels = GenericArrayModel<ComplaintJsonMappable>.fromListJson(responseData, (p0) => (p0 as List).map((data) => ComplaintJsonMappable.fromJson(data)).toList());
          
          // list.map((data) => ComplaintJsonMappable.fromJson(data)).toList();
      setState(() {
        cellModels = complaintModels.data;
      });

      // Update the UI or perform other actions based on the response
    } catch (e) {
      // Handle errors
      print('Error fetching data: $e');
      // You may want to show an error message to the user or take other actions
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
