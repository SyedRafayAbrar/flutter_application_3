import 'dart:ffi';

class ComplaintJsonMappable {
  int id;
  String complaintsSubject;
  String complaintsBody;
  StatusJsonMappable complaintsCurrentStatus;

  ComplaintJsonMappable({
    required this.id,
    required this.complaintsSubject,
    required this.complaintsBody,
    required this.complaintsCurrentStatus,
  });

  factory ComplaintJsonMappable.fromJson(Map<String, dynamic> json) {
    return ComplaintJsonMappable(
      id: json['id'],
      complaintsSubject: json['complaints_subject'],
      complaintsBody: json['complaints_body'],
      complaintsCurrentStatus: StatusJsonMappable.fromJson(json['complaints_current_status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'complaints_subject': complaintsSubject,
      'complaints_body': complaintsBody,
      'complaints_current_status': complaintsCurrentStatus.toJson(),
    };
  }
}

class StatusJsonMappable {
  int id;
  String statusName;

  StatusJsonMappable({
    required this.id,
    required this.statusName,
  });

  factory StatusJsonMappable.fromJson(Map<String, dynamic> json) {
    return StatusJsonMappable(
      id: json['id'],
      statusName: json['status_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status_name': statusName,
    };
  }
}


