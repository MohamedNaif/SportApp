import 'dart:convert';

import 'package:http/http.dart';
import 'package:myapp/data/model/teams_model/teams_model.dart';

class TeamsRepo {

  Future < TeamsModel? > getTeamsData({required int leagueId , required String teamName }) async {

    try {
      var respose = await get(Uri.parse(
        "https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=ab891d6b5d8e467937d5ab9683da4c0760e2a13b1443ca4bb8c0f42e265a798a&leagueId=$leagueId&teamName=$teamName")) ;
      Map < String , dynamic > ourResponse = json.decode(respose.body) ;
     if ( respose.statusCode == 200){
      TeamsModel data = TeamsModel.fromJson(ourResponse) ;
      if ( data.result != null){
        return data ;
      }else {
        return null ;
      }
      
     }else{
      return null ;
     } 

    } catch (error) {
      print("error $error") ;
    }
  }
}