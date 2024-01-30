import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Helpers/network_helper.dart';
import 'package:flutter_application_3/Helpers/secure_storage.dart';
import 'package:flutter_application_3/components/cellItems/menu_cells.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/models/genericModel.dart';
import 'package:flutter_application_3/models/loginModel.dart';

class SideBar extends StatelessWidget {
  SideBar({super.key});
  final menus = [
    MenuCellModel(menuTitle: "Home", menuIcon: Icon(Icons.home)),
    MenuCellModel(menuTitle: "Notifications", menuIcon: Icon(Icons.notifications)),
    MenuCellModel(
      menuTitle: "Complaints",
      menuIcon: Icon(Icons.note),
    ),
    MenuCellModel(
      menuTitle: "logout",
      menuIcon: Icon(Icons.exit_to_app),
    )
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

                    case 3:
                      logoutAction();
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

  Future<void> logoutAction() async {
    final responseData = await NetworkHelper()
        .getData(endpoint: EndPointTypes.logout, body: {"user_id": 3});
    var logOutModelResponse = GenericModel<LoginModel>.fromJson(
        responseData, (p0) => LoginModel.fromJson(p0));
    if (logOutModelResponse.status == 200) {
      await secureStorateShared.deleteSecureData(KeyChainAccessConstants.apiToken);
      await secureStorateShared.deleteSecureData(KeyChainAccessConstants.userId);
      NavigationService.navigateTo(
        AppRoutes.login,
        NavigationType.presentRoot,
        arguments: {'data': 'Hello'},
      );
    }
  }
}
