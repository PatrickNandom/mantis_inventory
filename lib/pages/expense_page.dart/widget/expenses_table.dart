import 'package:flutter/material.dart';

class ExpenditureTable extends StatelessWidget {
  final List<Map<String, dynamic>> expenditures;

  const ExpenditureTable({super.key, required this.expenditures});

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
          width: 900,
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
                        'Supplier',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Amount',
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
                      flex: 3,
                      child: Text(
                        'Description',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Category',
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
                  itemCount: expenditures.length,
                  separatorBuilder: (_, __) =>
                      const Divider(height: 0, color: Colors.black12),
                  itemBuilder: (context, index) {
                    final expenditure = expenditures[index];
                    final isOddRow = index % 2 == 0;

                    return Container(
                      color: isOddRow ? Colors.grey[100] : null,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(expenditure['supplier'] ?? ''),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(expenditure['amount'] ?? ''),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(expenditure['date'] ?? ''),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(expenditure['description'] ?? ''),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(expenditure['category'] ?? ''),
                          ),
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
