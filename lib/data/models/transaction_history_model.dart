class Transaction {
  final String invoiceNumber;
  final String transactionType;
  final String description;
  final int totalAmount;
  final DateTime createdOn;

  Transaction({
    required this.invoiceNumber,
    required this.transactionType,
    required this.description,
    required this.totalAmount,
    required this.createdOn,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      invoiceNumber: json['invoice_number'],
      transactionType: json['transaction_type'],
      description: json['description'],
      totalAmount: json['total_amount'],
      createdOn: DateTime.parse(json['created_on']),
    );
  }
}
