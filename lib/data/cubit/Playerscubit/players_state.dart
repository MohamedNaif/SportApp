part of 'players_cubit.dart';

@immutable
abstract class PlayersState {}

class PlayersInitial extends PlayersState {}
class Playersloading extends PlayersState {}
class PlayersSucceed extends PlayersState {
  final PlayersModel playerData ;
  PlayersSucceed({required this.playerData}) ;
}
class PlayersError extends PlayersState {}
