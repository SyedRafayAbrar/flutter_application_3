import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/global.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool shouldShowMenu;

  BaseScaffold(
      {required this.title, required this.body, this.shouldShowMenu = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(title),
          leading: Column(
            children: [getBackWidget(), getMenuWidget()],
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

  Widget getMenuWidget() {
    return shouldShowMenu
        ? IconButton(
            icon: const Icon(Icons.menu_rounded, color: Colors.black),
            onPressed: () => NavigationService.goBack(),
          )
        : const SizedBox.shrink();
  }
}
