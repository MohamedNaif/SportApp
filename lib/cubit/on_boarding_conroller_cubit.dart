import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'on_boarding_conroller_state.dart';

class OnBoardingControllerCubit extends Cubit<OnBoardingConrollerState> {
  OnBoardingControllerCubit() : super(OnBoardingControllerInitial());
  int currentIndex = 0;
  getIndex(int i) {
    currentIndex = i;
    emit(OnBoardingControllerInitial());
  }
}
