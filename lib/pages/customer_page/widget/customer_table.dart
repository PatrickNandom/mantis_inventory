import 'package:flutter/material.dart';
import 'package:mantis_inventory/models/customers_model.dart';

class CustomerTable extends StatelessWidget {
  // final List<Map<String, String>> customers;

  final List<Customer> customers;

  const CustomerTable({super.key, required this.customers});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 720,
          child: Column(
            children: [
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '#',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Customer Type',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Phone Number',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Actions',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(height: 1, color: Colors.black12),

              SizedBox(
                height: 600,
                child: ListView.separated(
                  itemCount: customers.length,
                  separatorBuilder: (_, __) =>
                      const Divider(height: 0, color: Colors.black12),
                  itemBuilder: (context, index) {
                    final customer = customers[index];
                    final isOddRow = index % 2 == 0;

                    return Container(
                      color: isOddRow ? Colors.grey[100] : null,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Expanded(flex: 1, child: Text('${index + 1}')),
                          Expanded(flex: 2, child: Text(customer.name)),
                          Expanded(flex: 3, child: Text(customer.email)),
                          Expanded(
                            flex: 2,
                            child: Text(customer.customerType),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(customer.phoneNumber),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 18,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
