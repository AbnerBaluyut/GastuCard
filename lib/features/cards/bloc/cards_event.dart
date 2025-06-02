
part of 'cards_bloc.dart';

sealed class CardsEvent {}

final class GetCardsEvent extends CardsEvent {}
final class AddCardEvent extends CardsEvent {}