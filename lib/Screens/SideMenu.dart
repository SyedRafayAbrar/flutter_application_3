import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/cellItems/menuCells.dart';

class SideBar extends StatelessWidget {
  SideBar({super.key});
  final menus = [MenuCellModel(menuTitle: "Home", menuIcon: Icon(Icons.home)),MenuCellModel(menuTitle: "Bookmarks", menuIcon: Icon(Icons.bookmark))];
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return MenuCell(model: menus[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: menus.length));
  }
}
