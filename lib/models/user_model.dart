import 'dart:convert';

class UserModel {
  int? id;
  String? userName;
  String? email;
  String? residenceStatus;
  AppartmentInfoMappable? appartmentInfo;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.residenceStatus,
    required this.appartmentInfo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['user_name'],
      email: json['email'],
      residenceStatus: json['residence_status'],
      appartmentInfo: AppartmentInfoMappable.fromJson(json['appartment_info']),
    );
  }

  static Map<String, dynamic> toMap(UserModel model) => <String, dynamic>{
        'id': model.id,
        'user_name': model.userName,
        'email': model.email,
        'residence_status': model.residenceStatus,
        'appartmentInfo': AppartmentInfoMappable.toMap(model.appartmentInfo!),
      };

  static String serialize(UserModel model) =>
      json.encode(UserModel.toMap(model));

  static UserModel deserialize(String json) =>
      UserModel.fromJson(jsonDecode(json));
}

class AppartmentInfoMappable {
  int id;
  String unitNo;
  String blockNo;
  String remainingAddress;

  AppartmentInfoMappable({
    required this.id,
    required this.unitNo,
    required this.blockNo,
    required this.remainingAddress,
  });

  factory AppartmentInfoMappable.fromJson(Map<String, dynamic> json) {
    return AppartmentInfoMappable(
      id: json['id'],
      unitNo: json['unit_no'],
      blockNo: json['block_no'],
      remainingAddress: json['remaining_address'],
    );
  }

  static Map<String, dynamic> toMap(AppartmentInfoMappable model) =>
      <String, dynamic>{
        'id': model.id,
        'unit_no': model.unitNo,
        'block_no': model.blockNo,
        'remaining_address': model.remainingAddress,
      };
      
}

class UnAuthorizeError {
  String detail;

  UnAuthorizeError({
    required this.detail,
  });

  factory UnAuthorizeError.fromJson(Map<String, dynamic> json) {
    return UnAuthorizeError(
      detail: json['detail'],
    );
  }
}
