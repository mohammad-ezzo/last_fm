import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'splash_event.dart';
part 'splash_state.dart';
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial());
  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
