import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/model/top_score_model/top_score_model.dart';
import 'package:myapp/data/repo/TopScoreRepo/top_score_repo.dart';

part 'top_scorer_state.dart';

class TopScorerCubit extends Cubit<TopScorerState> {
  TopScorerCubit() : super(TopScorerInitial());

  void getTopscorerData(int leagueId) {
    emit(TopScorerLoading());
    TopScorerRepo().getTopScorerRepo(leagueId: leagueId).then((value) {
      if (value != null) {
        emit(TopScorerSucceed(topscorerData: value));
      } else {
        emit(TopScorerError());
      }
    });
  }
}
