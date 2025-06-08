// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Customer {
  final String name;
  final String email;
  final String customerType;
  final String phoneNumber;

  Customer({
    required this.name,
    required this.email,
    required this.customerType,
    required this.phoneNumber,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      customerType: json['customerType'] ?? 'UNKNOWN',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'customerType': customerType,
      'phoneNumber': phoneNumber,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      name: map['name'] as String,
      email: map['email'] as String,
      customerType: map['customerType'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }
}
