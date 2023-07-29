part of 'top_scorer_cubit.dart';

@immutable
abstract class TopScorerState {}

class TopScorerInitial extends TopScorerState {}
class TopScorerLoading extends TopScorerState {}
class TopScorerSucceed extends TopScorerState {
  final TopScorerModel topscorerData ;
  TopScorerSucceed({required this.topscorerData}) ;

}
class TopScorerError extends TopScorerState {}
