import 'dart:convert';
import 'package:http/http.dart' as http;

enum BaseUrlType {
  devMode,
  prodMode
}

extension BaseUrlTypeExtension on BaseUrlType {
  String get baseUrl {
    switch (this) {
      case BaseUrlType.devMode:
        return "127.0.0.1:8000"; // Replace with the actual development base URL
      case BaseUrlType.prodMode:
        return "127.0.0.1:8000"; // Replace with the actual production base URL
    }
  }
}

enum EndPointTypes {
  getComplaints
}

extension EndPointTypesExtension on EndPointTypes {
  String get url {
    switch (this) {
      case EndPointTypes.getComplaints:
        return "/api/get_complaints"; // Replace with the actual development base URL // Replace with the actual production base URL
    }
  }

  Map<String, String> get requestHeaders {
    switch (this) {
      case EndPointTypes.getComplaints:
        return {
       'Content-type': 'application/json',
       'Accept': 'application/json',
       'Authorization': 'token 3cf2a2f3c0bbef0b8e3bc18262c30598eb89a1be'
     }; // Replace with the actual development base URL // Replace with the actual production base URL
    }
  }
}


class NetworkHelper {
  final BaseUrlType baseUrlModel = BaseUrlType.devMode;

  NetworkHelper();

  Future<dynamic> getData(EndPointTypes endpoint) async {
    try {
      var url = Uri.http(baseUrlModel.baseUrl, endpoint.url);
      var response = await http.get(url, headers: endpoint.requestHeaders);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        // Handle errors here, you can throw an exception or return an error model
        throw Exception('Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('Failed to load data. Error: $e');
    }
  }
}