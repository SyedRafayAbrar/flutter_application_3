import 'package:flutter/material.dart';
import 'package:flutter_application_3/Helpers/constants.dart';
import 'package:flutter_application_3/Helpers/network_helper.dart';
import 'package:flutter_application_3/Helpers/secure_storage.dart';
import 'package:flutter_application_3/models/complaintModel.dart';
import 'package:flutter_application_3/models/genericModel.dart';
import 'package:flutter_application_3/models/loginModel.dart';
import 'package:flutter_application_3/models/user_model.dart';

class AuthRequestHandler {
  Future<GenericModel<SignUpModel>?> postSignUp(
      String userName, String password, String email) async {
    try {
      var endpoint = EndPointTypes.signUp;
      var responseData = await NetworkHelper().getData(
          endpoint: endpoint,
          body: {"username": userName, "password": password, "email": email});

      return GenericModel<SignUpModel>.fromJson(
          responseData, (p0) => SignUpModel.fromJson(p0));
    } catch (e) {
      // Handle errors
      print('Error fetching data: $e');
      // You may want to throw a custom exception or handle errors in a specific way
      // For simplicity, let's return null in case of an error
      return null;
    }
  }

  Future<GenericModel<LoginModel>?> postInvitation(
      String invitationCode) async {
    try {
      var endpoint = EndPointTypes.checkInvitation;
      var responseData =
          await NetworkHelper().getData(endpoint: endpoint, body: {
        "user_id": await secureStorateShared
            .readSecureData(KeyChainAccessConstants.userId) as String,
        "invitation_code": invitationCode
      });

      return GenericModel<LoginModel>.fromEmptyJson(
          responseData, (p0) => LoginModel.fromJson(p0));
    } catch (e) {
      // Handle errors
      print('Error fetching data: $e');
      // You may want to throw a custom exception or handle errors in a specific way
      // For simplicity, let's return null in case of an error
      return null;
    }
  }

  Future<GenericModel<LoginModel>?> assignResidentialStatus(
      int statusId) async {
    try {
      var endpoint = EndPointTypes.assignResidentialStatus;
      var responseData =
          await NetworkHelper().getData(endpoint: endpoint, body: {
        "user": await secureStorateShared
            .readSecureData(KeyChainAccessConstants.userId) as String,
        "residence_status": statusId
      });

      return GenericModel<LoginModel>.fromEmptyJson(
          responseData, (p0) => LoginModel.fromJson(p0));
    } catch (e) {
      // Handle errors
      print('Error fetching data: $e');
      // You may want to throw a custom exception or handle errors in a specific way
      // For simplicity, let's return null in case of an error
      return null;
    }
  }

  Future<GenericModel<LoginModel>?> addAppartment(
      String remainingAddress, String blockNo, String unitNo) async {
    try {
      var endpoint = EndPointTypes.addAppartment;
      var responseData =
          await NetworkHelper().getData(endpoint: endpoint, body: {
        "user_id": await secureStorateShared
            .readSecureData(KeyChainAccessConstants.userId) as String,
        "remaining_address": remainingAddress,
        "block_no": blockNo,
        "unit_no": unitNo
      });

      return GenericModel<LoginModel>.fromEmptyJson(
          responseData, (p0) => LoginModel.fromJson(p0));
    } catch (e) {
      // Handle errors
      print('Error fetching data: $e');
      // You may want to throw a custom exception or handle errors in a specific way
      // For simplicity, let's return null in case of an error
      return null;
    }
  }
}
