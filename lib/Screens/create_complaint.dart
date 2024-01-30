import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/helpers.dart';
import 'package:flutter_application_3/Helpers/network_helper.dart';
import 'package:flutter_application_3/Helpers/request_handler.dart';
import 'package:flutter_application_3/Helpers/stateHandlers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/primary_button.dart';
import '../components/primary_text_field.dart';
import 'package:flutter_application_3/Screens/base_scaffold.dart';

class CreateComplaintScreen extends ConsumerWidget {
  final TextEditingController complaintSubjectController = TextEditingController();
  final TextEditingController complaintBodyController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: BaseScaffold(
        title: "Create Complaint",
        body: Column(
          children: [
            PrimaryTextField(
              labelTextValue: "Complaint Subject",
              hintTextValue: "Subject",
              textEditingController: complaintSubjectController,
            ),
            PrimaryTextField(
              labelTextValue: "Complaint Description",
              hintTextValue: "Write here",
              textEditingController: complaintBodyController,
              maxLines: null,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                PrimaryButton(title: "Submit", onPressed: () => onLoginPressed(ref)),
              ],
            ),
          ],
        ),
        shouldShowMenu: false,
      ),
    );
  }

  void onLoginPressed(WidgetRef ref) async {
    var resp = await RequestHandler().postComplaint(
        complaintSubjectController.text, complaintBodyController.text);

    if ((resp?.status ?? 0) == 200) {
      ref.read(complaintsProvider.notifier).update(ref);
      Navigator.pop(ref.context);
    } else {
      logger.e('Error Occurred');
    }
  }
}
