import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/global.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  BaseScaffold({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: pageCount >= 1
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => NavigationService.goBack(),
              )
            : null,
      ),
      body: body,
    );
  }
}
