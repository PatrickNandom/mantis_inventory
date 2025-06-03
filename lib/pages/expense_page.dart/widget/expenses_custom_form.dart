import 'package:flutter/material.dart';
import 'package:mantis_inventory/pages/expense_page.dart/expenses_page.dart';
import 'package:mantis_inventory/widgets/custom_text_field.dart';

class ExpensesCustomForm extends StatefulWidget {
  const ExpensesCustomForm({super.key});

  @override
  State<ExpensesCustomForm> createState() => _ExpensesCustomFormState();
}

class _ExpensesCustomFormState extends State<ExpensesCustomForm> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  labelName: 'Supplier',
                  hintText: 'Search by supplier',
                ),
                SizedBox(height: 15),
                CustomTextField(
                  labelName: 'Unit Price',
                  hintText: 'Enter unit price',
                ),
                SizedBox(height: 15),
                CustomTextField(
                  labelName: 'Quantity',
                  hintText: 'Enter quantity',
                ),

                SizedBox(height: 15),

                CustomTextField(
                  labelName: 'Amount',
                  hintText: 'Search by Amount',
                ),

                SizedBox(height: 15),

                CustomTextField(
                  labelName: 'Item/Description',
                  hintText: 'Enter description',
                ),

                SizedBox(height: 15),

                CustomTextField(
                  labelName: 'Category',
                  hintText: 'Eg Acquisition',
                ),

                SizedBox(height: 15),

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ExpensesPage()),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
