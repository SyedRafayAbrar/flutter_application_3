class GenericModel<T> {
  int status;
  T data;
  String error;

  GenericModel({
    required this.status,
    required this.data,
    required this.error,
  });

  factory GenericModel.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return GenericModel(
      status: json['status'],
      data: fromJsonT(json['data']),
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson(Object Function(T) toJsonT) {
    return {
      'status': status,
      'data': toJsonT(data),
      'error': error,
    };
  }
}

class GenericArrayModel<T> {
  int status;
  List<T> data;
  String error;

  GenericArrayModel({
    required this.status,
    required this.data,
    required this.error,
  });

    factory GenericArrayModel.fromListJson(Map<String, dynamic> json, List<T> Function(dynamic) fromListJsonT) {
    return GenericArrayModel(
      status: json['status'],
      data: fromListJsonT(json['data']),
      error: json['error'],
    );
  }

  factory GenericArrayModel.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return GenericArrayModel(
      status: json['status'],
      data: [fromJsonT(json['data'])],
      error: json['error'],
    );
  }

}
