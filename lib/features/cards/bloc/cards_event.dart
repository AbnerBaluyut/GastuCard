
part of 'cards_bloc.dart';

sealed class CardsEvent {}

final class GetCardsEvent extends CardsEvent {}
final class AddCardEvent extends CardsEvent {}
final class DeleteCardEvent extends CardsEvent {
  final int id;
  DeleteCardEvent(this.id);
}

final class _GetUpdatedCardsEvent extends CardsEvent {
  final List<Card> cards;
  _GetUpdatedCardsEvent(this.cards);
}