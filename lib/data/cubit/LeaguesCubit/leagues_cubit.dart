import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/model/leagues_model/leagues_model.dart';
import 'package:myapp/data/repo/LeaguesRepo/leagues_repo.dart';

part 'leagues_state.dart';

class LeaguesCubit extends Cubit<LeaguesState> {
  LeaguesCubit() : super(LeaguesInitial());

  getLeaguesData(int countryId) async {
    emit(LeaguesLoading());

    LeaguesRepo().getLeaguesDataRepo(countryId: countryId ).then((value) {
      if (value != null) {
        emit(LeaguesSucceed(leaguesData: value));
      } else {
        emit(LeaguesError());
      }
    });
  }
}
