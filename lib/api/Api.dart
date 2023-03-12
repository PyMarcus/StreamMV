import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Video.dart';


const String TOKEN = "AIzaSyB68X_U_KPHv3hcnvC4rltG3beEIKc73SE";
const String CHANNEL_ID = "mg7netw1JuM";
const String BASE_URL = "https://www.googleapis.com/youtube/v3";


class Api{

  Future<List<Video>> search(String? find) async{
    http.Response response = await http.get(
        BASE_URL + "/search?part=snippet&type=video&maxResults=20&order=date&key=$TOKEN&q=$find"
    );
    print(BASE_URL + "/search?part=snippet&type=video&maxResults=20&order=date&key=$TOKEN&q=$find");

    if(response.statusCode == 200){
        Map<String, dynamic> json_data = json.decode(response.body);
        List<Video> videos = json_data["items"].map<Video>(
            (map){
              return Video.fromJson(map);
            }
        ).toList();
     return videos;
    }
    return [];
  }

}