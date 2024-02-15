
import 'package:flutter_application_3/Helpers/request_handler.dart';
import 'package:flutter_application_3/models/appartment_model.dart';
import 'package:flutter_application_3/models/complaintModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appartmentsFutureProvider = FutureProvider<List<AppartmentBaseModel>?>((ref) async {
  try {
    var apiHandler = RequestHandler();
    var complaintModels = await apiHandler.getAppartments();

    if (complaintModels != null) {
      return complaintModels.data;
    } else {
      // Handle null response
      // You might want to show an error message to the user
      return null;
    }
  } catch (e) {
    // Handle errors
    print('Error: $e');
    // Show an alert or handle the error in a way suitable for your app
    return null;
  }
});

final appartmentProvider = StateNotifierProvider<AppartmentNotifier, List<AppartmentBaseModel>?>((ref) {
  final asyncValue = ref.watch(appartmentsFutureProvider);
  return AppartmentNotifier(asyncValue: asyncValue);
});

class AppartmentNotifier extends StateNotifier<List<AppartmentBaseModel>?> {
  AppartmentNotifier({AsyncValue<List<AppartmentBaseModel>?>? asyncValue})
      : super(asyncValue?.value) {
    asyncValue?.whenData((data) {
      state = data;
    });
  }

   Future<void> update(WidgetRef ref) async {
    try {
      // Trigger the re-evaluation of the FutureProvider to perform the API call
      ref.refresh(appartmentsFutureProvider);
      
      // Get the latest data from the FutureProvider
      var latestComplaints = ref.read(appartmentsFutureProvider);

      if (latestComplaints != null) {
        state = latestComplaints.value;
      } else {
        // Handle null response
        // You might want to show an error message to the user
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
      // Show an alert or handle the error in a way suitable for your app
    }
  }
}

