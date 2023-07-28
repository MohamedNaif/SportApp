part of 'leagues_cubit.dart';

@immutable
abstract class LeaguesState {}

class LeaguesInitial extends LeaguesState {}

class LeaguesLoading extends LeaguesState {}

class LeaguesSucceed extends LeaguesState {
  final LeaguesModel leaguesData;
  LeaguesSucceed({required this.leaguesData});
}

class LeaguesError extends LeaguesState {}
