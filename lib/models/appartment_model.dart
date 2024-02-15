
import 'package:flutter_application_3/models/user_model.dart';

class AppartmentBaseModel {
  AppartmentInfoMappable appartment;
  String residenceStatus;

  AppartmentBaseModel({
    required this.appartment,
    required this.residenceStatus,
  });

  factory AppartmentBaseModel.fromJson(Map<String, dynamic> json) {
    return AppartmentBaseModel(
      residenceStatus: json['residence_status'],
      appartment: AppartmentInfoMappable.fromJson(json['appartment']),
    );
  }

}
