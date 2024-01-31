import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/auth_req_handler.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/Helpers/network_helper.dart';
import 'package:flutter_application_3/Helpers/request_handler.dart';
import 'package:flutter_application_3/Helpers/secure_storage.dart';
import '../components/primary_button.dart';
import '../components/primary_text_field.dart';
import 'package:flutter_application_3/Screens/base_scaffold.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailTextController;
  late TextEditingController pwdTextController;
  late TextEditingController userNameTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailTextController = TextEditingController();
    pwdTextController = TextEditingController();
    userNameTextController = TextEditingController();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    pwdTextController.dispose();
    userNameTextController.dispose();
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
                labelTextValue: "UserName",
                hintTextValue: "Enter UserName",
                textEditingController: userNameTextController),
            PrimaryTextField(
                labelTextValue: "Email",
                hintTextValue: "Enter Email Address",
                textEditingController: emailTextController),
            PrimaryTextField(
                labelTextValue: "Password",
                hintTextValue: "Enter Password",
                textEditingController: pwdTextController),
            const SizedBox(
              height: 20,
            ),
            Column(children: [
              PrimaryButton(title: "SignUp", onPressed: onSignUpPressed),
            ]),
          ],
        ),
        shouldShowMenu: false,
      ),
    );
  }

  void onSignUpPressed() async {
    final response = await AuthRequestHandler().postSignUp(
        userNameTextController.text,
        pwdTextController.text,
        emailTextController.text);
    if (response?.data != null) {
      final loginToken = response?.data?.token ?? '';
      final userId = response?.data?.id;
      logger.i('token received $loginToken');
      secureStorateShared.writeSecureData(KeyChainAccessConstants.apiToken, loginToken);
      secureStorateShared.writeSecureData(KeyChainAccessConstants.userId, userId.toString());
      NavigationService.navigateTo(AppRoutes.InvitationScreen, NavigationType.push,
          arguments: {'data': 'Hello'});
    }
  }
}
