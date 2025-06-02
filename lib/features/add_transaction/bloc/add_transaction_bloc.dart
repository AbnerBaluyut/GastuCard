import 'package:bloc/bloc.dart';

part 'add_transaction_event.dart';
part 'add_transaction_state.dart';

class AddTransactionBloc extends Bloc<AddTransactionEvent, AddTransactionState> {

  AddTransactionBloc() : super(InitialState());
}