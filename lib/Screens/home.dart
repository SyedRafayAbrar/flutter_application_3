import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';
import 'package:flutter_application_3/components/cellItems/homeCells.dart';
// import 'package:flutter_application_3/components/cellItems/h';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseScaffold(
        title: "Home",
        body: Column(
          children: [
            Container(
              height: 40,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                IconButton(
                    onPressed: () => (),
                    icon: Image.asset(AppImageConstants.filterIcon)),
              ]),
            ),
            Expanded(
              child: HomeListView(),
            )
          ],
        ),
        shouldShowMenu: true,
      ),
    );
  }
}

class HomeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
        itemBuilder: (BuildContext context, int index) {
          return HomeCell();
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: 3);
  }
}
