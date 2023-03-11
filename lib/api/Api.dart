import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


const String TOKEN = "AIzaSyCX0cA0njfWg69xQjqn1MrGd_NoMVVm2_E";
const String CHANNEL_ID = "mg7netw1JuM";
const String BASE_URL = "https://www.googleapis.com/youtube/v3";


class Api{

  search(String find) async{
    print("olá mundo");
    http.Response response = await http.get(
        BASE_URL + "/search?part=snippet&type=video&maxResults=20&order=date&key=$TOKEN&q=$find"
    );
    print(response.statusCode);

    if(response.statusCode == 200){
        Map<String, dynamic> json_data = json.decode(response.body);
        print(json_data['items'][0]["snippet"]["title"]);
        print(json_data['items'][0]["id"]["videoId"]);
    }else{

    }
  }

}