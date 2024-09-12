class StockHistory {
  final String productId;
  final int quantity;
  final String type; // 'Added' or 'Removed'
  final DateTime date;

  StockHistory({
    required this.productId,
    required this.quantity,
    required this.type,
    required this.date,
  });

  // Convert StockHistory to JSON
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'type': type,
      'date': date.toIso8601String(),
    };
  }

  // Create StockHistory from JSON
  factory StockHistory.fromJson(Map<String, dynamic> json) {
    return StockHistory(
      productId: json['productId'],
      quantity: json['quantity'],
      type: json['type'],
      date: DateTime.parse(json['date']),
    );
  }
}
