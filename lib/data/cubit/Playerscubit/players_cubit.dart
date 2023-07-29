import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/model/players_model/players_model.dart';
import 'package:myapp/data/repo/PlayersRepo/players_repo.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersInitial());

  getPlayersData(String teamId , String playerId){
    emit(Playersloading()) ;
    PlayersRepo().getPlayersRepo(teamId: teamId, playerId: playerId).then((value){
      if ( value != null ){
      emit(PlayersSucceed(playerData: value)) ;
      }else {
        emit(PlayersError()) ;
      }
    });
  }
}
