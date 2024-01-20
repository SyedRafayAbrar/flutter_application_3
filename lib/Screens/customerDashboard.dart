import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/appTheme.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';
import 'package:flutter_application_3/components/cellItems/homeCells.dart';
// import 'package:flutter_application_3/components/cellItems/h';

class CustomerDashboardScreen extends StatelessWidget {
  final List<DashboardInfoViewModel> dashboardInfoList = [
    DashboardInfoViewModel(titleNameLabel: "Flat No:", valueLabel: "205"),
    DashboardInfoViewModel(titleNameLabel: "Block No:", valueLabel: "1"),
    DashboardInfoViewModel(
        titleNameLabel: "Address:",
        valueLabel: "Falaknaz presidency, Near malir cantt")
  ];

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
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
              child: Row(
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
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
              child: Row(
                children: [
                  Text(
                    "Residence Status:",
                    style: dashboardTheme.textTheme.titleSmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Owner",
                    style: TextStyle(
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
          return GestureDetector(
              child: Container(
            child: Row(
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
            ),
          ));
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: models.length);
  }
}
