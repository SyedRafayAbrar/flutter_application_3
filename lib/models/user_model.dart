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

