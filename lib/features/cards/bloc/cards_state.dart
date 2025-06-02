part of 'cards_bloc.dart';

sealed class CardsState extends Equatable {
  const CardsState();
  @override
  List<Object?> get props => [];
}

final class InitialState extends CardsState {}


// Cards
final class LoadingCardsState extends CardsState {}
final class GetCardsState extends CardsState {
  final List<Card> cards;
  const GetCardsState({required this.cards});
  @override
  List<Object?> get props => [cards];
}
