part of 'countries_cubit.dart';

@immutable
abstract class CountriesState {}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesSucceed extends CountriesState {
  final CountriesModel countriesData;
  CountriesSucceed({required this.countriesData});
}

class CountriesError extends CountriesState {}
