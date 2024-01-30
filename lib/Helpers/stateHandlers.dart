import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/network_helper.dart';
import 'package:flutter_application_3/Helpers/request_handler.dart';
import 'package:flutter_application_3/models/complaintModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final complaintsFutureProvider = FutureProvider<List<ComplaintJsonMappable>?>((ref) async {
  try {
    var apiHandler = RequestHandler();
    var complaintModels = await apiHandler.getComplaints();

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

final complaintsProvider = StateNotifierProvider<ComplaintsNotifier, List<ComplaintJsonMappable>?>((ref) {
  final asyncValue = ref.watch(complaintsFutureProvider);
  return ComplaintsNotifier(asyncValue: asyncValue);
});

class ComplaintsNotifier extends StateNotifier<List<ComplaintJsonMappable>?> {
  ComplaintsNotifier({AsyncValue<List<ComplaintJsonMappable>?>? asyncValue})
      : super(asyncValue?.value) {
    asyncValue?.whenData((data) {
      state = data;
    });
  }

   Future<void> update(WidgetRef ref) async {
    try {
      // Trigger the re-evaluation of the FutureProvider to perform the API call
      ref.refresh(complaintsFutureProvider);
      
      // Get the latest data from the FutureProvider
      var latestComplaints = ref.read(complaintsFutureProvider);

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


// final complaintsProvider = StateNotifierProvider<ComplaintsNotifier, List<ComplaintJsonMappable>?>((ref) {
//    try {
//     var apiHandler = RequestHandler();
//     var complaintModels = await apiHandler.getComplaints();

//     if (complaintModels != null) {
//       return ComplaintsNotifier(complaints:complaintModels.data);
//       // return complaintModels.data;
//     } else {
//       // Handle null response
//       // You might want to show an error message to the user
//       return ComplaintsNotifier();
//     }
//   } catch (e) {
//     // Handle errors
//     print('Error: $e');
//     // Show an alert or handle the error in a way suitable for your app
//     return ComplaintsNotifier();
//   }
  
// });

// // final complaintsProvider = FutureProvider<List<ComplaintJsonMappable>?>((ref) async {
// //   try {
// //     var apiHandler = RequestHandler();
// //     var complaintModels = await apiHandler.getComplaints();

// //     if (complaintModels != null) {
// //       return complaintModels.data;
// //     } else {
// //       // Handle null response
// //       // You might want to show an error message to the user
// //       return null;
// //     }
// //   } catch (e) {
// //     // Handle errors
// //     print('Error: $e');
// //     // Show an alert or handle the error in a way suitable for your app
// //     return null;
// //   }
// // });

// class ComplaintsNotifier extends StateNotifier<List<ComplaintJsonMappable>?> {
//   ComplaintsNotifier({complaints}) : super(complaints);

//   void update(List<ComplaintJsonMappable> newComplaints) {
//     state = newComplaints;
//   }
// }