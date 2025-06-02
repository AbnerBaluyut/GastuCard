part of 'add_card_bloc.dart';

sealed class AddCardState extends Equatable {
  const AddCardState();
  @override
  List<Object?> get props => [];
}

final class InitialState extends AddCardState {}
final class SuccessState extends AddCardState {}
final class ErrorState extends AddCardState {
  final String errorMessage;
  const ErrorState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}