import 'package:flutter/material.dart';
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
                height: 60,
                color: Colors.brown,
                child: Row(children: []),
              ),
              Expanded(
                child: HomeListView(),
              )
            ],
          )),
    );
  }
}

class HomeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return HomeCell();
        });
  }
}
