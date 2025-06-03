import 'package:flutter/material.dart';

class IncomeTable extends StatelessWidget {
  final List<Map<String, dynamic>> incomes;

  const IncomeTable({super.key, required this.incomes});

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
          width: 960,
          child: Column(
            children: [
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Customer',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'No of Kg',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Price per KG',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Grade',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Category',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Total Amount',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Action',
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
                  itemCount: incomes.length,
                  separatorBuilder: (_, __) =>
                      const Divider(height: 0, color: Colors.black12),
                  itemBuilder: (context, index) {
                    final income = incomes[index];
                    final isOddRow = index % 2 == 0;

                    return Container(
                      color: isOddRow ? Colors.grey[100] : null,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(income['customer'] ?? ''),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(income['kg'].toString()),
                          ),
                          Expanded(flex: 2, child: Text(income['date'] ?? '')),
                          Expanded(
                            flex: 2,
                            child: Text(income['pricePerKg'] ?? ''),
                          ),
                          Expanded(flex: 1, child: Text(income['grade'] ?? '')),
                          Expanded(
                            flex: 1,
                            child: Text(income['category'] ?? ''),
                          ),
                          Expanded(flex: 2, child: Text(income['total'] ?? '')),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: const Icon(
                                Icons.more_vert,
                                size: 18,
                                color: Colors.black,
                              ),
                              onPressed: () {},
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
