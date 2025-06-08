class Expense {
  final double amount;
  final int quantity;
  final double unitPrice;
  final String description;
  final String category;

  Expense({
    required this.amount,
    required this.quantity,
    required this.unitPrice,
    required this.description,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'description': description,
      'category': category,
    };
  }

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      amount: (json['amount'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 0,
      unitPrice: (json['unitPrice'] ?? 0).toDouble(),
      description: json['description'] ?? '',
      category: json['category'] ?? '',
    );
  }
}
