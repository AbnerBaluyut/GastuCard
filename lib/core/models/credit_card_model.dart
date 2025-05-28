class CreditCardModel {

  final String id;
  final String name;
  final double limit;
  final DateTime dueDate;
  final DateTime statementDate;
  final String bankName;

  CreditCardModel({
    required this.id,
    required this.name,
    required this.limit,
    required this.dueDate,
    required this.statementDate,
    required this.bankName,
  });
}