import 'package:flutter/material.dart';
import 'package:mantis_inventory/pages/customer_page/customers_page.dart';
import 'package:mantis_inventory/widgets/custom_text_field.dart';

class CustomerForm extends StatelessWidget {
  final _customerNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  CustomerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Customers',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  labelName: 'Customer Name',
                  hintText: 'Enter Customer Name',
                  controller: _customerNameController,
                ),
                SizedBox(height: 15),
                CustomTextField(
                  labelName: 'Email',
                  hintText: 'Enter Email',
                  controller: _emailController,
                ),
                SizedBox(height: 15),
                CustomTextField(
                  labelName: 'Phone Number',
                  hintText: 'Enter Phone Number',
                  controller: _phoneController,
                ),

                SizedBox(height: 15),
                CustomTextField(labelName: 'Customer Type', hintText: ''),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CustomersPage()),
                    );
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
    );
  }
}
