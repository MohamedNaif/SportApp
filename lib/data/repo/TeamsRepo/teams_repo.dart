import 'dart:convert';

import 'package:http/http.dart';
import 'package:myapp/data/model/teams_model/teams_model.dart';

class TeamsRepo {

  Future < TeamsModel? > getTeamsData() async {

    try {
      var respose = await get(Uri.parse("https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=96&APIkey=ab891d6b5d8e467937d5ab9683da4c0760e2a13b1443ca4bb8c0f42e265a798a")) ;
      Map < String , dynamic > ourResponse = json.decode(respose.body) ;
     if ( respose.statusCode == 200){
      TeamsModel data = TeamsModel.fromJson(ourResponse) ;
      return data ;
     }else{
      return null ;
     } 

    } catch (error) {
      print("error $error") ;
    }
  }
}