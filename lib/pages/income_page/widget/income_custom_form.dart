import 'package:flutter/material.dart';
import 'package:mantis_inventory/pages/income_page/income_page.dart';
import 'package:mantis_inventory/widgets/custom_text_field.dart';
import 'package:mantis_inventory/widgets/date_picker.dart';

class IncomeCustomForm extends StatefulWidget {
  const IncomeCustomForm({super.key});

  @override
  State<IncomeCustomForm> createState() => _IncomeCustomFormState();
}

class _IncomeCustomFormState extends State<IncomeCustomForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Add Sales Record',
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
                ),
                SizedBox(height: 15),
                CustomTextField(
                  labelName: 'No of Kg',
                  hintText: 'Enter number of Kg',
                ),
                SizedBox(height: 15),
                CustomTextField(
                  labelName: 'Price Per Kg',
                  hintText: 'Enter price per kilk',
                ),

                SizedBox(height: 15),

                CustomTextField(labelName: 'Grade', hintText: 'eg 1 or 2'),
                SizedBox(height: 15),
                CustomTextField(labelName: 'Category', hintText: 'Eg Sales'),

                SizedBox(height: 15),

                CustomTextField(
                  labelName: 'Amount',
                  hintText: 'Search by Amount',
                ),

                SizedBox(height: 15),

                TextAndDatePickerColumn(displayText: 'Date From'),

                SizedBox(height: 15),

                TextAndDatePickerColumn(displayText: 'Date To'),

                SizedBox(height: 15),

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => IncomePage()),
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
