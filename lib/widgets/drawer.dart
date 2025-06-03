import 'package:flutter/material.dart';
import 'package:mantis_inventory/pages/customer_page/customers_page.dart';
import 'package:mantis_inventory/pages/dashboard.dart';
import 'package:mantis_inventory/pages/expense_page.dart/expenses_page.dart';
import 'package:mantis_inventory/pages/income_page/income_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/logo.png', height: 40, width: 40),
                    SizedBox(width: 8),
                    Text(
                      'Mantis',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text('Dashboard'),
              ],
            ),
          ),
          _buildMenuItem(Icons.access_time, 'Default', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Dashboard()),
            );
          }),
          ListTile(
            title: Text('Farm Management', style: TextStyle(fontSize: 18)),
          ),
          _buildMenuItem(Icons.people, 'Customers', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CustomersPage()),
            );
          }),
          _buildMenuItem(Icons.attach_money, 'Income', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => IncomePage()),
            );
          }),
          _buildMenuItem(Icons.language_sharp, 'Expenses', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ExpensesPage()),
            );
          }),
          ListTile(title: Text('Reports', style: TextStyle(fontSize: 18))),
          _buildMenuItem(Icons.settings, 'Sales Expenses', () {}),
          ListTile(title: Text('Uploads', style: TextStyle(fontSize: 18))),
          _buildMenuItem(Icons.settings, 'Upload Expenses', () {}),
          _buildMenuItem(Icons.settings, 'Upload Income', () {}),
        ],
      ),
    );
  }

  // Sidebar menu item
  Widget _buildMenuItem(IconData icon, String title, Function()? tap) {
    return ListTile(
      leading: Icon(icon, size: 18),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      onTap: tap,
    );
  }
}
