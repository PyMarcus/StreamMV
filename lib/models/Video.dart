import 'package:flutter/material.dart';


class Video{

    String id = "";
    String title = "";
    String description = "";
    String image = "";
    String channel = "";

    // constructor
    Video(this.id,
      this.title,
      this.description,
      this.image,
      this.channel
    );

     factory Video.fromJson(Map<String, dynamic> json){
        return Video(
            json["id"]["videoId"], json["snippet"]["title"],
            json["snippet"]["description"], json["snippet"]["thumbnails"]["high"]["url"],
            json["snippet"]["channelTitle"]
        );
    }


}
