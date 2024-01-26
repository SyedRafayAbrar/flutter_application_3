import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/global.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/Screens/side_menu.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool shouldShowMenu;

  BaseScaffold(
      {required this.title, required this.body, this.shouldShowMenu = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
          title: Text(title),
          leading: Column(
            children: [getBackWidget(), getMenuWidget(context)],
          )),
      body: body,
    );
  }

  Widget getBackWidget() {
    return pageCount >= 1
        ? IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => NavigationService.goBack(),
          )
        : const SizedBox.shrink();
  }

  Widget getMenuWidget(BuildContext context) {
    return shouldShowMenu
        ? Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu_rounded, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          )
        : const SizedBox.shrink();
  }
}
