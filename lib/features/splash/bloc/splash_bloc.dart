import 'package:bloc/bloc.dart';
import 'package:gastu_card/core/utils/extensions/int_ext.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  SplashBloc() : super(SplashInitialState()) {
    on<DoSplashEvent>(_start);
  }

  void _start(DoSplashEvent event, Emitter<SplashState> emit) async {
    
    emit(SplashLoadingState());
    await Future.delayed(3.seconds());
    emit(SplashLoadedState());
  } 
}