import 'package:flutter/material.dart';
import 'package:mantis_inventory/models/customers_model.dart';
import 'package:mantis_inventory/pages/customer_page/widget/customer_form.dart';
import 'package:mantis_inventory/pages/customer_page/widget/customer_table.dart';
import 'package:mantis_inventory/services/api_service.dart';
import 'package:mantis_inventory/widgets/app_bar.dart';
import 'package:mantis_inventory/widgets/drawer.dart';
import 'package:mantis_inventory/widgets/footer.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  final ApiService apiService = ApiService();
  late Future<List<Customer>> futureCustomers;


  @override
  void initState() {
    super.initState();
    futureCustomers = apiService.fetchCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: customAppBar(),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomFooter(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        'Customers',
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
                        MaterialPageRoute(builder: (context) => CustomerForm()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),

              FutureBuilder<List<Customer>>(
                future: futureCustomers,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.blue),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No customers found.');
                  } else {
                    return CustomerTable(customers: snapshot.data!);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



























// import 'package:flutter/material.dart';
// import 'package:mantis_inventory/models/customers.dart';
// import 'package:mantis_inventory/pages/customer_page/widget/customer_form.dart';
// import 'package:mantis_inventory/pages/customer_page/widget/customer_table.dart';
// import 'package:mantis_inventory/services/api_service.dart';
// import 'package:mantis_inventory/utils/utils.dart';
// import 'package:mantis_inventory/widgets/app_bar.dart';
// import 'package:mantis_inventory/widgets/drawer.dart';
// import 'package:mantis_inventory/widgets/footer.dart';

// class CustomersPage extends StatefulWidget {
//   const CustomersPage({super.key});

//   @override
//   State<CustomersPage> createState() => _CustomersPageState();
// }

// class _CustomersPageState extends State<CustomersPage> {
//   final ApiService apiService = ApiService();

//   late Future<List<Customer>> futureCustomers;

//   @override
//   void initState() {
//     super.initState();
//     futureCustomers = apiService.fetchCustomers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: customAppBar(),
//       drawer: CustomDrawer(),
//       bottomNavigationBar: CustomFooter(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Text('Home', style: TextStyle(fontSize: 18)),
//                       SizedBox(width: 5),
//                       Text('>', style: TextStyle(fontSize: 18)),
//                       SizedBox(width: 5),

//                       Text(
//                         'Customers',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.add_circle_outline, size: 30),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => CustomerForm()),
//                       );
//                     },
//                   ),
//                 ],
//               ),

//               SizedBox(height: 10),

//               CustomerTable(customers:  futureCustomers),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
