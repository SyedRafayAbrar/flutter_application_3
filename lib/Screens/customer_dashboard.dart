import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/app_theme.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Helpers/network_helper.dart';
import 'package:flutter_application_3/Helpers/request_handler.dart';
import 'package:flutter_application_3/Helpers/secure_storage.dart';
import 'package:flutter_application_3/Screens/base_scaffold.dart';
import 'package:flutter_application_3/models/genericModel.dart';
import 'package:flutter_application_3/models/user_model.dart';
// import 'package:flutter_application_3/components/cellItems/h';

class CustomerDashboardScreen extends StatefulWidget {
  @override
  State<CustomerDashboardScreen> createState() =>
      _CustomerDashboardScreenState();
}

class _CustomerDashboardScreenState extends State<CustomerDashboardScreen> {
  List<DashboardInfoViewModel> dashboardInfoList = [];

  UserModel? userInfo;

  Future<void> getUser() async {
    try {
      var apiHandler = RequestHandler();
      var userInfoModel = await apiHandler.getUser();
      
      if (userInfoModel.data != null) {
        // list.map((data) => ComplaintJsonMappable.fromJson(data)).toList();
        var userData = userInfoModel.data!;
        var serialized = UserModel.serialize(userData);
        await secureStorateShared.writeSecureData(KeyChainAccessConstants.user_model,serialized);

        setState(() {
          if (userInfoModel.data != null) {
            userInfo = userInfoModel.data;
            dashboardInfoList = [
              DashboardInfoViewModel(
                  titleNameLabel: "Flat No:",
                  valueLabel: userInfo?.appartmentInfo?.unitNo ?? ''),
              DashboardInfoViewModel(
                  titleNameLabel: "Block No:",
                  valueLabel: userInfo?.appartmentInfo?.blockNo ?? ''),
              DashboardInfoViewModel(
                  titleNameLabel: "Address:",
                  valueLabel: userInfo?.appartmentInfo?.remainingAddress ?? '')
            ];
          }
        });
      }

      // Update the UI or perform other actions based on the response
    } catch (e) {
      // Handle errors
      return _showMyDialog(e.toString());
      // You may want to show an error message to the user or take other actions
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  Future<void> _showMyDialog(String alert) async {
    final String message = alert;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context, ) {
      final String alertMessage = alert;
      return AlertDialog.adaptive(
        content: Text(alertMessage),
        actions:  <Widget>[
          TextButton(
            child: const Text('Done'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseScaffold(
        title: "Dashboard",
        body: Column(
          children: [
            Center(
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/nikeImage.jpg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                userInfo?.userName ?? '',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Maintenance Status:",
                    style: dashboardTheme.textTheme.titleSmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Paid",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Residence Status:",
                    style: dashboardTheme.textTheme.titleSmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    userInfo?.residenceStatus ?? '',
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            // add a line
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: const Divider(
                color: Colors.grey,
                thickness: 1,
                height: 1,
                indent: 16,
                endIndent: 16,
              ),
            ),
            Text(
              "Details",
              style: dashboardTheme.textTheme.displayLarge,
            ),
            Expanded(
              child: DashboardListView(models: dashboardInfoList),
            )
          ],
        ),
        shouldShowMenu: true,
      ),
    );
  }
}

class DashboardInfoViewModel {
  String titleNameLabel = "";
  String valueLabel = "";

  DashboardInfoViewModel({this.titleNameLabel = "", this.valueLabel = ""});
}

class DashboardListView extends StatelessWidget {
  List<DashboardInfoViewModel> models;

  DashboardListView({super.key, required this.models});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                models[index].titleNameLabel,
                style: dashboardTheme.textTheme.titleSmall,
              ),
              const SizedBox(
                width: 100,
              ),
              Expanded(
                  child: Text(
                models[index].valueLabel,
                style: dashboardTheme.textTheme.displaySmall,
              ))
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: models.length);
  }
}
