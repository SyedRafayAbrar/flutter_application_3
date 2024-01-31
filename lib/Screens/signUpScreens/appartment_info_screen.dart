import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/auth_req_handler.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/Helpers/network_helper.dart';
import 'package:flutter_application_3/Helpers/request_handler.dart';
import 'package:flutter_application_3/Helpers/secure_storage.dart';
import '../../components/primary_button.dart';
import '../../components/primary_text_field.dart';
import 'package:flutter_application_3/Screens/base_scaffold.dart';

class AppartmentInfoScreen extends StatefulWidget {
  @override
  State<AppartmentInfoScreen> createState() => _AppartmentInfoScreenState();
}

class _AppartmentInfoScreenState extends State<AppartmentInfoScreen> {
  late TextEditingController unitNoController;
  late TextEditingController blockNoController;
  late TextEditingController remainingAddressController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    unitNoController = TextEditingController();
    blockNoController = TextEditingController();
    remainingAddressController = TextEditingController();
  }

  @override
  void dispose() {
    unitNoController.dispose();
    blockNoController.dispose();
    remainingAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseScaffold(
        title: "Appartment Info",
        body: Column(
          children: [
            PrimaryTextField(
                labelTextValue: "Unit No",
                hintTextValue: "Enter Unit No",
                textEditingController: unitNoController),
            PrimaryTextField(
                labelTextValue: "Block No",
                hintTextValue: "Enter Block No",
                textEditingController: blockNoController),
            PrimaryTextField(
                labelTextValue: "Address",
                hintTextValue: "Enter Remaining Address",
                textEditingController: remainingAddressController),
            const SizedBox(
              height: 20,
            ),
            Column(children: [
              PrimaryButton(title: "Submit", onPressed: onSignUpPressed),
            ]),
          ],
        ),
        shouldShowMenu: false,
      ),
    );
  }

  void onSignUpPressed() async {
    final response = await AuthRequestHandler().addAppartment(remainingAddressController.text, blockNoController.text, unitNoController.text);
    if (response?.status == 200) {
      NavigationService.navigateTo(
          AppRoutes.selectResidentialScreen, NavigationType.push,
          arguments: {'data': 'Hello'});
    }
  }
}
