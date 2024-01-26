

import 'package:flutter_application_3/Helpers/network_helper.dart';
import 'package:flutter_application_3/models/complaintModel.dart';
import 'package:flutter_application_3/models/genericModel.dart';

class RequestHandler {
    
    Future<GenericArrayModel<ComplaintJsonMappable>?> getComplaints() async {
    try {
      var endpoint = EndPointTypes.getComplaints;
      var responseData = await NetworkHelper().getData(endpoint: endpoint);

      return GenericArrayModel<ComplaintJsonMappable>.fromListJson(
        responseData,
        (p0) => (p0 as List).map((data) => ComplaintJsonMappable.fromJson(data)).toList(),
      );
    } catch (e) {
      // Handle errors
      print('Error fetching data: $e');
      // You may want to throw a custom exception or handle errors in a specific way
      // For simplicity, let's return null in case of an error
      return null;
    }
  }
}