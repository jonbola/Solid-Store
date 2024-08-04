class UserDataModel {
  final int? id;
  final String? firstName; 
  final String? lastName; 
  final String? phoneNumber;
  final String? gender;
  final String? nation;
  final String? name; 
  final String? email; 
 
  UserDataModel({
    this.id,
    this.firstName, 
    this.lastName,
    this.phoneNumber,
    this.gender,
    this.nation,
    this.name,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'nation': nation,
      'name': name,
      'email': email,
    };
  }

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      nation: json['nation'],
      name: json['name'],
      email: json['email'],
    );
  }
}
