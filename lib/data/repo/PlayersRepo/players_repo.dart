import 'package:http/http.dart';
import 'dart:convert';

import 'package:myapp/data/model/players_model/players_model.dart';

class PlayersRepo {
  Future<PlayersModel?> getPlayersRepo(
      {required String teamId,
      required String playerId,
      required String playerName}) async {
    try {
      var response = await get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?&met=Players&playerId=$playerId&APIkey=ab891d6b5d8e467937d5ab9683da4c0760e2a13b1443ca4bb8c0f42e265a798a&teamId=$teamId&playerName=$playerName"));
      Map<String, dynamic> ourResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        PlayersModel data = PlayersModel.fromJson(ourResponse);
        if (data.result != null) {
          return data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("error : $e");
    }
  }
}
