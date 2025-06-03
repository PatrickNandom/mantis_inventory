import 'package:flutter/material.dart';
import 'package:mantis_inventory/pages/income_page/widget/incom_table.dart';
import 'package:mantis_inventory/pages/income_page/widget/income_custom_form.dart';
import 'package:mantis_inventory/pages/income_page/widget/income_data.dart';
import 'package:mantis_inventory/widgets/app_bar.dart';
import 'package:mantis_inventory/widgets/drawer.dart';
import 'package:mantis_inventory/widgets/footer.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: customAppBar(),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomFooter(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumb
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text('Home', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 5),
                      Text('>', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 5),
                      Text(
                        'Income',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline, size: 30),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IncomeCustomForm(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),

              IncomeTable(incomes: incomeData),
            ],
          ),
        ),
      ),
    );
  }
}
