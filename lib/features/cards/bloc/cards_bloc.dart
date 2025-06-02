import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';

import '../../../_di/dependencies.dart';
import '../../../core/services/database/app_database.dart';
import '../../../data/repositories/card_repository.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {

  final CardRepository _cardRepository = getIt();

  CardsBloc() : 
  super(InitialState()) {
    on<GetCardsEvent>(_getCards);
    on<AddCardEvent>(_addCard);
  }

  _getCards(GetCardsEvent event, Emitter<CardsState> emit) async {
    emit(LoadingCardsState());
    final cards = await _cardRepository.getCards();
    emit(GetCardsState(cards: cards));    
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
}