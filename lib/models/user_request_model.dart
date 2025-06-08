class UserRequestModel {
  final String firstName;
  final String middleName;
  final String lastName;
  final String username;
  final String email;
  final String address;
  final String phone;
  final String password;

  UserRequestModel({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'address': address,
      'phone': phone,
      'password': password,
    };
  }

  factory UserRequestModel.fromJson(Map<String, dynamic> json) {
    return UserRequestModel(
      firstName: json['firstName'] ?? '',
      middleName: json['middleName'] ?? '',
      lastName: json['lastName'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      password: json['password'] ?? '',
    );
  }
}
