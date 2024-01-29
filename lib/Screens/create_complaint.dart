import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/Helpers/network_helper.dart';
import 'package:flutter_application_3/Helpers/request_handler.dart';
import '../components/primary_button.dart';
import '../components/primary_text_field.dart';
import 'package:flutter_application_3/Screens/base_scaffold.dart';

class CreateComplaintScreen extends StatefulWidget {
  @override
  State<CreateComplaintScreen> createState() => _CreateComplaintScreenState();
}

class _CreateComplaintScreenState extends State<CreateComplaintScreen> {
  late TextEditingController complaintSubjectController;
  late TextEditingController complaintBodyController;

  @override
  void initState() {
    complaintSubjectController = TextEditingController();
    complaintBodyController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    complaintSubjectController.dispose();
    complaintBodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseScaffold(
        title: "Create Complaint",
        body: Column(
          children: [
            PrimaryTextField(
                labelTextValue: "Complaint Subject",
                hintTextValue: "Subject",
                textEditingController: complaintSubjectController),
            PrimaryTextField(
              labelTextValue: "Complaint Description",
              hintTextValue: "Write here",
              textEditingController: complaintBodyController,
              maxLines: null,
            ),
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
    var resp = await RequestHandler().postComplaint(
        complaintSubjectController.text, complaintBodyController.text);
    if ((resp?.status ?? 0) == 200) {
      Navigator.pop(context);
    } else {
      logger.e('Error Occured');
    }
  }
}
