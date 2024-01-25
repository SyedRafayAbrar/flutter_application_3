
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/appTheme.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/Helpers/networkHelper.dart';
import 'package:flutter_application_3/Helpers/secure_storage.dart';
import 'package:flutter_application_3/models/genericModel.dart';
import 'package:flutter_application_3/models/loginModel.dart';
import 'package:flutter_application_3/models/postModels/loginPostModel.dart';
import '/components/primaryButton.dart';
import '/components/primaryTextField.dart';
import 'package:flutter_application_3/Screens/BaseScaffold.dart';

class LoginScreen extends StatefulWidget {


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController emailTextController;
  late TextEditingController pwdTextController;

  @override
  void initState() {
    emailTextController = TextEditingController();
    pwdTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    pwdTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: dashboardTheme,
      home: BaseScaffold(
        title: "Login",
        body: Column(
          children: [
            PrimaryTextField(
                textEditingController: emailTextController,
                labelTextValue: "UserName",
                hintTextValue: "Enter UserName"),
            PrimaryTextField(textEditingController: pwdTextController,
                labelTextValue: "Password", hintTextValue: "Enter Password"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () => (NavigationService.navigateTo(
                        AppRoutes.forgotPW, NavigationType.push,
                        arguments: {'data': 'Hello'})),
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0)),
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(fontFamily: 'OutFit'),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(children: [
              PrimaryButton(title: "Login", onPressed: onLoginPressed),
              const SizedBox(
                height: 20,
              ),
              Text("Or"),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(title: "SignUp", onPressed: onSignUpPressed),
            ]),
          ],
        ),
      ),
    );
  }

  void onLoginPressed() async {
    
    final responseData = await NetworkHelper().getData(endpoint: EndPointTypes.login,body: {"username": emailTextController.text, "password":pwdTextController.text});
     // Process the responseData as needed

    var loginModelResponse = GenericModel<LoginModel>.fromJson(responseData, (p0) => LoginModel.fromJson(p0));
    final loginToken = loginModelResponse.data?.token;
    logger.i('token received $loginToken');
    logger.i('role received ${loginModelResponse.data?.userRole?.role.roleDisplayName ?? ''}');
    if (loginToken != null) {
      SecureStorage().writeSecureData(KeyChainAccessConstants.apiToken, loginToken);
      NavigationService.navigateTo(
        AppRoutes.customerDashboard, NavigationType.presentRoot,
        arguments: {'data': 'Hello'});
    }
  }

  void onSignUpPressed() {
    NavigationService.navigateTo(AppRoutes.signUp, NavigationType.push,
        arguments: {'data': 'Hello'});
  }
}
