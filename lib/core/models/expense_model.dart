class ExpenseModel {
  final String id;
  final String cardId;
  final String description;
  final double amount;
  final double processingFee;
  final double interestFee;
  final String category;
  final DateTime date;

  ExpenseModel({
    required this.id,
    required this.cardId,
    required this.description,
    required this.amount,
    required this.processingFee,
    required this.interestFee,
    required this.category,
    required this.date,
  });
}