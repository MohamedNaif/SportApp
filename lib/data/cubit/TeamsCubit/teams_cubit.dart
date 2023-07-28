import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/model/teams_model/teams_model.dart';
import 'package:myapp/data/repo/TeamsRepo/teams_repo.dart';

part 'teams_state.dart';

class TeamsCubit extends Cubit<TeamsState> {
  TeamsCubit() : super(TeamsInitial());

  getTeams(int leaguesKey , String teamName){
    emit(TeamsLoading()) ;
    TeamsRepo().getTeamsData(leagueId: leaguesKey , teamName: teamName).then((value) {
      if ( value != null){
        emit(TeamsSucceed(teamsData: value)) ;
      }
      else {
        emit(TeamsError()) ;
      }
    });
  }
}
