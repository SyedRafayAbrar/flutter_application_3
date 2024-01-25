import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/appTheme.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Helpers/networkHelper.dart';
import 'package:flutter_application_3/Helpers/secure_storage.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';
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
      // Example: Fetch data for a specific endpoint
      var endpoint = EndPointTypes.getUser;
      var responseData = await NetworkHelper().getData(endpoint: endpoint,body: {'user_id':3});

      // Process the responseData as needed
      //  final list = (responseData['data'] as List);
      var userInfoModel = GenericModel<UserModel>.fromJson(
          responseData, (p0) => UserModel.fromJson(p0));

      // list.map((data) => ComplaintJsonMappable.fromJson(data)).toList();
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
    getUser();
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
                "Saleem",
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
