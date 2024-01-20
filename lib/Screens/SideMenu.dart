import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/cellItems/menuCells.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';

class SideBar extends StatelessWidget {
  SideBar({super.key});
  final menus = [
    MenuCellModel(menuTitle: "Home", menuIcon: Icon(Icons.home)),
    MenuCellModel(menuTitle: "Bookmarks", menuIcon: Icon(Icons.bookmark)),
    MenuCellModel(menuTitle: "Complaints", menuIcon: Icon(Icons.note),)
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      NavigationService.navigateTo(
                        AppRoutes.customerDashboard,
                        NavigationType.presentRoot,
                        arguments: {'data': 'Hello'},
                      );
                      break;
                    
                    case 1:
                      NavigationService.navigateTo(
                        AppRoutes.complaint,
                        NavigationType.presentRoot,
                        arguments: {'data': 'Hello'},
                      );
                      break;

                    case 2:
                      NavigationService.navigateTo(
                        AppRoutes.complaint,
                        NavigationType.presentRoot,
                        arguments: {'data': 'Hello'},
                      );
                      break;
                    default:
                      print("default");
                      break;
                  }
                },
                child: MenuCell(model: menus[index]),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: menus.length));
  }
}
