class LoginModel {
  int? id;
  String? userName;
  String? email;
  String? token;
  UserRoleJsonMappable? userRole;
  


  LoginModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.token,
    required this.userRole,

  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      userName: json['user_name'],
      email: json['email'],
      token: json['token'],
      userRole: UserRoleJsonMappable.fromJson(json['user_role']),
    );
  }

}


class UserRoleJsonMappable {
  int id;
  RoleJsonMappable role;

  UserRoleJsonMappable({
    required this.id,
    required this.role,
  });

  factory UserRoleJsonMappable.fromJson(Map<String, dynamic> json) {
    return UserRoleJsonMappable(
      id: json['id'],
      role: RoleJsonMappable.fromJson(json['role']),
    );
  }


}



class RoleJsonMappable {
  int id;
  String roleName;
  String roleDisplayName;

  RoleJsonMappable({
    required this.id,
    required this.roleName,
    required this.roleDisplayName,
  });

  factory RoleJsonMappable.fromJson(Map<String, dynamic> json) {
    return RoleJsonMappable(
      id: json['id'],
      roleName: json['role_name'],
      roleDisplayName: json['role_display_name'],
    );
  }


}