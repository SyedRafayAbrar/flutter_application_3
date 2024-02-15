import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/auth_req_handler.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import '../../components/primary_button.dart';
import '../../components/primary_text_field.dart';
import 'package:flutter_application_3/Screens/base_scaffold.dart';

class InvitationScreen extends StatefulWidget {
  @override
  State<InvitationScreen> createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen> {
  late TextEditingController inviteCodeController;
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
        title: "Sign Up",
        body: Column(
          children: [
            PrimaryTextField(
                labelTextValue: "Invitation Code",
                hintTextValue: "Invitation Code",
                textEditingController: inviteCodeController),
            const SizedBox(
              height: 20,
            ),
            Column(children: [
              PrimaryButton(title: "Submit", onPressed: onLoginPressed),
            ]),
          ],
        ),
        shouldShowMenu: false,
      ),
    );
  }

  void onLoginPressed() async {
    final response =
        await AuthRequestHandler().postInvitation(inviteCodeController.text);
    if (response?.status == 200) {
      NavigationService.navigateTo(AppRoutes.myAppartments, NavigationType.push,
          arguments: {'data': 'Hello'});
    }
  }
}
