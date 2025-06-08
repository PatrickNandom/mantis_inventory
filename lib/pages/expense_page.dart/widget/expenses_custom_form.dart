import 'package:flutter/material.dart';
import 'package:mantis_inventory/models/expenses_model.dart';
import 'package:mantis_inventory/pages/expense_page.dart/expenses_page.dart';
import 'package:mantis_inventory/services/api_service.dart';
import 'package:mantis_inventory/widgets/custom_drop_down.dart';
import 'package:mantis_inventory/widgets/custom_text_field.dart';

class ExpensesCustomForm extends StatefulWidget {
  const ExpensesCustomForm({super.key});

  @override
  State<ExpensesCustomForm> createState() => _ExpensesCustomFormState();
}

class _ExpensesCustomFormState extends State<ExpensesCustomForm> {
  final _unitPriceController = TextEditingController();

  final _quantityController = TextEditingController();

  final _amountController = TextEditingController();

  final _descritionController = TextEditingController();
  String? _selectedCategory;

  final _formKey = GlobalKey<FormState>();

  @override
  dispose() {
    _unitPriceController.dispose();
    _quantityController.dispose();
    _amountController.dispose();
    _descritionController.dispose();

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
          'Add Expenditure Record',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                  SupplierDropdown(
                    labelText: 'Supplier',
                    suppliers: ['Supplier A', 'Supplier B', 'Supplier C'],
                    onSelected: (value) {
                      print('Selected supplier: $value');
                    },
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    labelName: 'Unit Price',
                    hintText: 'Enter unit price',
                    controller: _unitPriceController,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Unit price is required!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    labelName: 'Quantity',
                    hintText: 'Enter quantity',
                    controller: _quantityController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Quantity is required!';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 15),

                  CustomTextField(
                    labelName: 'Amount',
                    hintText: 'Search by Amount',
                    controller: _amountController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the amount!';
                      }
                    },
                  ),

                  SizedBox(height: 15),

                  CustomTextField(
                    labelName: 'Item/Description',
                    hintText: 'Enter description',
                    controller: _descritionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the descrition!';
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 15),

                  SupplierDropdown(
                    labelText: 'Category',
                    suppliers: ['ACQUISITION', 'OTHERS'],
                    onSelected: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),

                  SizedBox(height: 15),

                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
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
                          final expense = Expense(
                            category: _selectedCategory!,
                            amount: double.parse(_amountController.text.trim()),
                            unitPrice: double.parse(
                              _unitPriceController.text.trim(),
                            ),
                            quantity: int.parse(
                              _quantityController.text.trim(),
                            ),
                            description: _descritionController.text.trim(),
                          );

                          await ApiService().addExpense(expense);
                          Navigator.of(context).pop();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text(
                                'Expense added successfully!',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => ExpensesPage()),
                          );
                        } catch (e) {
                          Navigator.of(context).pop();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.blue,

                              content: Text(
                                'Failed to add expense',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
