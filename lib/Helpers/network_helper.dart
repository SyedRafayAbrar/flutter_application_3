import 'dart:convert';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Helpers/secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

enum BaseUrlType { devMode, prodMode }

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
  login,
  getComplaints,
  getUser,
  logout, 
  }

extension EndPointTypesExtension on EndPointTypes {
  String get url {
    switch (this) {
      case EndPointTypes.getComplaints:
        return "/api/get_complaints";
      case EndPointTypes.login:
        return "/api/login";
      case EndPointTypes.getUser:
        return "/api/get_user_model";
      case EndPointTypes.logout:
        return "/api/logout";  
    }
  }

  RequestMethod get method {
    switch (this) {
      case EndPointTypes.getComplaints:
        return RequestMethod
            .GET;
      case EndPointTypes.login || EndPointTypes.logout || EndPointTypes.getUser:
        return RequestMethod
            .POST;
    }
  }

  Future<Map<String, String>> get requestHeaders async {
    switch (this) {
      case EndPointTypes.getComplaints || EndPointTypes.getUser:
        return {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'token ${await SecureStorage().readSecureData(KeyChainAccessConstants.apiToken) as String}'
        };
      default:
        return {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        }; // Replace with the actual development base URL // Replace with the actual production base URL
    }
  }
}

class NetworkHelper {
  final BaseUrlType baseUrlModel = BaseUrlType.devMode;

  NetworkHelper();

  Future<dynamic> getData({required EndPointTypes endpoint, Object? body = Null, Map<String, dynamic>? queryParams}) async {
    try {
      http.Response response;
      var url = Uri.http(baseUrlModel.baseUrl, endpoint.url,queryParams);
      response = await http.get(url, headers: await endpoint.requestHeaders);

      // Log: Request URL
      logger.i('Request URL: $url');

      // Log: Request Method
      logger.i('Request Method: ${endpoint.method}');

      // Log: Request Headers
      logger.i('Request Headers: ${endpoint.requestHeaders}');

      switch (endpoint.method) {
        case RequestMethod.GET:
          response = await http.get(url, headers: await endpoint.requestHeaders,);
          break;
        case RequestMethod.POST:
          response = await http.post(url,
              headers: await endpoint.requestHeaders,
              body: jsonEncode(body));
          break;
        case RequestMethod.PATCH:
          response = await http.patch(url,
              headers: await endpoint.requestHeaders,
              body: jsonEncode(body));
          break;
        case RequestMethod.PUT:
          response = await http.put(url,
              headers: await endpoint.requestHeaders,
              body: jsonEncode(body));
          break;
        case RequestMethod.DELETE:
          response = await http.delete(url,
              headers: await endpoint.requestHeaders,
              body: jsonEncode(body));
          break;
        default:
          response = await http.get(url, headers: await endpoint.requestHeaders);
      }
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        // Handle errors here, you can throw an exception or return an error model
        throw Exception(
            'Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('Failed to load data. Error: $e');
    }
  }
}
