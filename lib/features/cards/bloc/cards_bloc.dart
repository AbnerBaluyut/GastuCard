import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:gastu_card/core/utils/extensions/int_ext.dart';

import '../../../_di/dependencies.dart';
import '../../../core/services/database/app_database.dart';
import '../../../data/repositories/card_repository.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {

  final CardRepository _cardRepository = getIt();

  StreamSubscription? _subscription;

  CardsBloc() : 
  super(InitialState()) {
    on<GetCardsEvent>(_getCards);
    on<AddCardEvent>(_addCard);
    on<DeleteCardEvent>(_deleteCard);
    on<_GetUpdatedCardsEvent>(_getUpdatedCards);
  }

  _getCards(GetCardsEvent event, Emitter<CardsState> emit) {
    
    _subscription?.cancel();
    _subscription = _cardRepository.getCards().listen((cards) {
      add(_GetUpdatedCardsEvent(cards)); 
    },
    cancelOnError: true, 
    onError: (err) {
      log("Errorg get cards");
    });
  }

  _getUpdatedCards(_GetUpdatedCardsEvent event, Emitter<CardsState> emit) async {
    emit(LoadingCardsState(isLoading: true));
    await Future.delayed(2.seconds());
    emit(GetCardsState(cards: event.cards));    
    await Future.delayed(300.milliseconds());
    emit(LoadingCardsState(isLoading: false));
  }

  _addCard(AddCardEvent event, Emitter<CardsState> emit) async {
    await _cardRepository.addCard(
      CardsCompanion(
        bankName: Value('BPI'),
        creditLimit: Value(50000),
        statementDueDate: Value(DateTime(2025, 6, 15)),
        paymentDueDate: Value(DateTime(2025, 6, 25)),
      )
    );
  }

  _deleteCard(DeleteCardEvent event, Emitter<CardsState> emit) async {
    await _cardRepository.deleteCard(id: event.id);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}