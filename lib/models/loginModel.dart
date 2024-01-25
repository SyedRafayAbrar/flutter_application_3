class LoginModel {
  int? id;
  String? userName;
  String? email;
  String? token;


  LoginModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.token,

  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      userName: json['user_name'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
      'email': email,
      'token': token,
    };
  }
}