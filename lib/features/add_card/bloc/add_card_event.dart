part of 'add_card_bloc.dart';

sealed class AddCardEvent {}

final class DoAddCardEvent extends AddCardEvent {
  final String bankName;
  final double creditLimit;
  final CreditCardNetworkEnum cardType;
  final DateTime statementDate;
  final DateTime paymentDueDate;
  final String hexColor;
  
  DoAddCardEvent({
    required this.bankName,
    required this.creditLimit,
    required this.cardType,
    required this.paymentDueDate,
    required this.statementDate,
    required this.hexColor
  });
}