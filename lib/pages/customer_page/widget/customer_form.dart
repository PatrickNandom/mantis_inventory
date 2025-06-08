import 'package:flutter/material.dart';
import 'package:mantis_inventory/models/customers_model.dart';
import 'package:mantis_inventory/pages/customer_page/customers_page.dart';
import 'package:mantis_inventory/services/api_service.dart';
import 'package:mantis_inventory/widgets/custom_text_field.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({super.key});

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final _customerNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _custonerTypeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  dispose() {
    _customerNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _custonerTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Add Customers',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    labelName: 'Customer Name',
                    hintText: 'Enter Customer Name',
                    controller: _customerNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Customer name is required!';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    labelName: 'Email',
                    hintText: 'Enter Email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'User name is required';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    labelName: 'Phone Number',
                    hintText: 'Enter Phone Number',
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone cannot be empty';
                      }
                    },
                  ),

                  SizedBox(height: 15),
                  CustomTextField(
                    labelName: 'Customer Type',
                    hintText: 'Enter cutomer type',
                    controller: _custonerTypeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Provide customer type!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        final apiService = ApiService();

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => Center(
                            child: CircularProgressIndicator(
                              color: Colors.grey,
                              backgroundColor: Colors.blue,
                            ),
                          ),
                        );

                        try {
                          final customer = Customer(
                            name: _customerNameController.text.trim(),
                            email: _emailController.text.trim(),
                            customerType: _custonerTypeController.text.trim(),
                            phoneNumber: _phoneController.text.trim(),
                          );

                          await apiService.addCustomer(customer);
                          Navigator.of(context).pop();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text(
                                'Customer added successfully!',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => CustomersPage()),
                          );
                        } catch (e) {
                          Navigator.of(context).pop();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text(
                                'Failed to add customer: $e',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
                      }
                    },

                    child: Container(
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          'Save Record',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
