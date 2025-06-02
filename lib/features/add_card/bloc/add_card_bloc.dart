import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';

import '../../../_di/dependencies.dart';
import '../../../app/styles/strings.dart';
import '../../../core/services/database/app_database.dart';
import '../../../shared/constants/enums/credit_card_network_enum.dart';

part 'add_card_event.dart';
part 'add_card_state.dart';

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {

  final AppDatabase db = getIt();

  AddCardBloc() : super(InitialState()) {
    on<DoAddCardEvent>(_addCard);
  }


  _addCard(DoAddCardEvent event, Emitter<AddCardState> emit) async {
    try {
      await db.into(db.cards).insert(
        CardsCompanion(
          bankName: Value(event.bankName),
          creditLimit: Value(event.creditLimit),
          cardType: Value(event.cardType.label),
          statementDueDate: Value(event.statementDate),
          paymentDueDate: Value(event.paymentDueDate),
          cardColorHex: Value(event.hexColor)
        )
      );
      emit(SuccessState());
    } catch (e) {
      log("Error add card: $e");
      emit(ErrorState(Strings.errorMessage));
    }
  }
}