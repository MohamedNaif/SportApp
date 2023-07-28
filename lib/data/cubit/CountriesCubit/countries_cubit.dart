import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/model/CountriesModel/countries_model.dart';
import 'package:myapp/data/repo/countries_repo/countries_repo.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesInitial());

  getCountriesDate() {
    emit(CountriesLoading());

    CountriesRepo().getCountries().then((value) {
      if (value != null) {
        emit(CountriesSucceed(countriesData: value));
      } else {
        emit(CountriesError());
      }
    });
  }
}
