class UserModel {
  final int? id;
  final String password;
  final String email;
  final String? role;

  UserModel({
    this.id,
    required this.password,
    required this.email,
    this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'password': password,
      'email': email,
      'role': role,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      password: json['password'],
      email: json['email'],
      role: json['role'],
    );
  }
}
