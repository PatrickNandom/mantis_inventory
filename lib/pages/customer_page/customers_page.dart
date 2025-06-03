import 'package:flutter/material.dart';
import 'package:mantis_inventory/pages/customer_page/widget/customer_form.dart';
import 'package:mantis_inventory/pages/customer_page/widget/customer_table.dart';
import 'package:mantis_inventory/utils.dart';
import 'package:mantis_inventory/widgets/app_bar.dart';
import 'package:mantis_inventory/widgets/drawer.dart';
import 'package:mantis_inventory/widgets/footer.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: customAppBar(),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomFooter(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Home', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 5),
                      Text('>', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 5),

                      Text(
                        'Customers',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline, size: 30),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CustomerForm()),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 10),

              CustomerTable(customers: customerData),
            ],
          ),
        ),
      ),
    );
  }
}
