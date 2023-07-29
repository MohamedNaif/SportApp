import 'dart:convert';

import 'package:http/http.dart';

import '../../model/top_score_model/top_score_model.dart';

class TopScorerRepo {
  Future<TopScorerModel?> getTopScorerRepo({required int leagueId}) async {
    try {
      var respose = await get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?&met=Topscorers&leagueId=$leagueId&APIkey=379594f1c6e5c8c8b706e1733527e2103f061ca2a436650e5098fd948ab731b3"));
      Map<String, dynamic> ourResponse = json.decode(respose.body);
      if (respose.statusCode == 200) {
        TopScorerModel data = TopScorerModel.fromJson(ourResponse);
        if (data.result != null) {
          return data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (error) {
      print("error $error");
    }
  }
}
