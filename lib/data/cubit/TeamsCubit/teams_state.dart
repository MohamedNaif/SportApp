part of 'teams_cubit.dart';

@immutable
abstract class TeamsState {}

class TeamsInitial extends TeamsState {}
class TeamsLoading extends TeamsState {}
class TeamsSucceed extends TeamsState {
  final TeamsModel teamsData ;
  TeamsSucceed({required this.teamsData}) ;
}
class TeamsError extends TeamsState {}
