import 'package:mantis_inventory/models/user_request_model.dart';

class SignUpRequestModel {
  final String name;
  final String description;
  final String email;
  final String phone;
  final UserRequestModel userRequestModel;

  SignUpRequestModel({
    required this.name,
    required this.description,
    required this.email,
    required this.phone,
    required this.userRequestModel,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'email': email,
      'phone': phone,
      'userRequestModel': userRequestModel.toJson(),
    };
  }

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    return SignUpRequestModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      userRequestModel: UserRequestModel.fromJson(
        json['userRequestModel'] ?? {},
      ),
    );
  }
}
