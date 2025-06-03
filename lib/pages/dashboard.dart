import 'package:flutter/material.dart';
import 'package:mantis_inventory/widgets/app_bar.dart';
import 'package:mantis_inventory/widgets/drawer.dart';
import 'package:mantis_inventory/widgets/footer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      drawer: CustomDrawer(),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Recent Sales',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 720,
                    child: Column(
                      children: [
                        // Header row
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 120,
                                child: Text(
                                  'Customer',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  'Kit No',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  'No of KG',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                child: Text(
                                  'Price per KG',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                child: Text(
                                  'Total Amount',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                child: Text(
                                  'Date',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          height: 800,
                          child: ListView.separated(
                            itemCount: 42,
                            separatorBuilder: (_, __) => const Divider(),
                            itemBuilder: (context, index) {
                              return Row(
                                children: const [
                                  SizedBox(width: 120, child: Text('Hassan')),
                                  SizedBox(width: 100, child: Text('K-001')),
                                  SizedBox(width: 80, child: Text('5')),
                                  SizedBox(
                                    width: 120,
                                    child: Text('₦6,000.00'),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    child: Text('₦30,000.00'),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    child: Text('Apr 22, 2025'),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomFooter(),
    );
  }
}
