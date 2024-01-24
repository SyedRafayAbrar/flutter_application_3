import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

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

enum RequestMethod { GET, POST, PATCH, DELETE, PUT }

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

  RequestMethod get method {
    switch (this) {
      case EndPointTypes.getComplaints:
        return RequestMethod.GET; // Replace with the actual development base URL // Replace with the actual production base URL
    }
  }

    Object get body {
    switch (this) {
      default:
        return Null; // Replace with the actual development base URL // Replace with the actual production base URL
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
      http.Response response;
      var url = Uri.http(baseUrlModel.baseUrl, endpoint.url);
      response = await http.get(url, headers: endpoint.requestHeaders);
      
         // Log: Request URL
      logger.i('Request URL: $url');

      // Log: Request Method
      logger.i('Request Method: ${endpoint.method}');

      // Log: Request Headers
      logger.i('Request Headers: ${endpoint.requestHeaders}');


       switch (endpoint.method) {
      case RequestMethod.GET:
        response = await http.get(url, headers: endpoint.requestHeaders);
        break;
      case RequestMethod.POST:
        response = await http.post(url, headers: endpoint.requestHeaders, body: jsonEncode(endpoint.body));
        break;
      case RequestMethod.PATCH:
        response = await http.patch(url, headers: endpoint.requestHeaders, body: jsonEncode(endpoint.body));
        break;
      case RequestMethod.PUT:
        response = await http.put(url, headers: endpoint.requestHeaders, body: jsonEncode(endpoint.body));
        break;
      case RequestMethod.DELETE:
        response = await http.delete(url, headers: endpoint.requestHeaders, body: jsonEncode(endpoint.body));
        break;
      default:
        response = await http.get(url, headers: endpoint.requestHeaders);
    }
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