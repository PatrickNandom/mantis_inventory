import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mantis_inventory/models/customers_model.dart';
import 'package:mantis_inventory/models/expenses_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://172.93.51.119:9090/api/v1';

  //FETCHING ALL CUSTOMER
  Future<List<Customer>> fetchCustomers({int page = 0, int size = 3}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString('signup_response');

      if (jsonString == null) {
        throw Exception('No signup response found in SharedPreferences.');
      }

      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      final String token = jsonData['token'];

      final response = await http.get(
        Uri.parse('$baseUrl/customers/pagination?page=$page&size=$size'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> customersJson = data['content'];

        print('Fetched customers: $customersJson');

        return customersJson.map((item) => Customer.fromJson(item)).toList();
      } else {
        print('Failed to fetch customers. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load customers: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching customers: $e');
      throw Exception('Failed to load customers: $e');
    }
  }

  // ADDING NEW CUSTOMER
  Future<void> addCustomer(Customer customer) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString('signup_response');

      if (jsonString == null) {
        throw Exception('No signup response found. Please log in again.');
      }

      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      final String token = jsonData['token'];
      print('Using token: $token');

      final response = await http.post(
        Uri.parse('$baseUrl/customers'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(customer.toMap()),
      );
      print(jsonEncode(customer.toMap()));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        print('Customer added successfully: $responseData');
        return responseData;
      } else {
        print('Failed to add customer. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to add customer');
      }
    } catch (e) {
      print('Error adding customer: $e');

      throw Exception('Failed to add customer: $e');
    }
  }

  //ADD NEW EXPENSES
  Future<void> addExpense(Expense expense) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString('signup_response');

      if (jsonString == null) {
        throw Exception('No signup response found. Please log in again.');
      }

      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      final String token = jsonData['token'];

      final response = await http.post(
        Uri.parse('$baseUrl/expenditures'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(expense.toMap()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Expense added successfully: ${response.body}');
      } else {
        print('Failed to add expense. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to add expense');
      }
    } catch (e) {
      print('Error adding expense: $e');
      throw Exception('Failed to add expense: $e');
    }
  }
}
