import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  bool isvalid = true ;
  valid (){
    isvalid = !isvalid ;
    emit(HomePageInitial()) ;
  } 
}
