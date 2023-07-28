import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myapp/data/model/leagues_model/leagues_model.dart';

class LeaguesRepo {
  Future<LeaguesModel?> getLeaguesData() async {
    try {
      var response = await get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=ab891d6b5d8e467937d5ab9683da4c0760e2a13b1443ca4bb8c0f42e265a798a"));

      Map<String, dynamic> ourResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        LeaguesModel data = LeaguesModel.fromJson(ourResponse);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print("error $e");
    }
  }
}
