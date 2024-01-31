import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/auth_req_handler.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import '../../components/primary_button.dart';
import '../../components/primary_text_field.dart';
import 'package:flutter_application_3/Screens/base_scaffold.dart';

class ResidentialStatusModel {
  final String title;
  final int id;
  ResidentialStatusModel({required this.title, required this.id});
}

class SelectResidentialScreen extends StatefulWidget {
  @override
  State<SelectResidentialScreen> createState() =>
      SelectResidentialScreenState();
}

final List<ResidentialStatusModel> list = [
  ResidentialStatusModel(title: "Owner", id: 1),
  ResidentialStatusModel(title: "Tenant", id: 2)
];

class SelectResidentialScreenState extends State<SelectResidentialScreen> {
  late TextEditingController inviteCodeController;
  ResidentialStatusModel dropdownValue = list.first;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inviteCodeController = TextEditingController();
  }

  @override
  void dispose() {
    inviteCodeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseScaffold(
        title: "Select Residential Status",
        body: Center(
          child: Column(
            children: [
              DropdownMenuExample(onResidentialStatusChanged: (value) {
                setState(() {
                  dropdownValue = value;
                });
              },),
              const SizedBox(
                height: 20,
              ),
              Column(children: [
                PrimaryButton(title: "Submit", onPressed: onLoginPressed),
              ]),
            ],
          ),
        ),
        shouldShowMenu: false,
      ),
    );
  }

  void onLoginPressed() async {
    final response =
        await AuthRequestHandler().assignResidentialStatus(dropdownValue.id);
    if (response?.status == 200) {
      NavigationService.navigateTo(
        AppRoutes.customerDashboard, NavigationType.presentRoot,
        arguments: {'data': 'Hello'});
    
    }
  }
}

class DropdownMenuExample extends StatefulWidget {
 
  final void Function(ResidentialStatusModel) onResidentialStatusChanged;

  const DropdownMenuExample({Key? key, required this.onResidentialStatusChanged})
      : super(key: key);

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  ResidentialStatusModel dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<ResidentialStatusModel>(
    
      initialSelection: list.first,
      onSelected: (ResidentialStatusModel? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          widget.onResidentialStatusChanged(dropdownValue);
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<ResidentialStatusModel>>((ResidentialStatusModel value) {
        return DropdownMenuEntry<ResidentialStatusModel>(value: value, label: value.title);
      }).toList(),
    );
  }
}
