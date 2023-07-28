import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'on_boarding_controller_state.dart';

class OnBoardingControllerCubit extends Cubit<OnBoardingControllerState> {
  OnBoardingControllerCubit() : super(OnBoardingControllerInitial());
  int currentIndex = 0;
  getIndex(int i) {
    currentIndex = i;
    emit(OnBoardingControllerInitial());
  }
}
