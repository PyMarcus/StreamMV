import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import '../api/Api.dart';
import '../models/Video.dart';


class Home extends StatefulWidget {

  String? query;

  Home(this.query);


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _HomeState();

  Future<List<Video>> _listVideos({String? find = ''})
  {
    Api api = Api();
    return api.search(widget.query);
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
        future: _listVideos(),
        builder: (context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
                return const CircularProgressIndicator();
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                if(snapshot.hasData){
                    return ListView.separated(
                        itemBuilder: (context, index){
                          List<Video>? videos = snapshot.data;
                          if(videos!.length > 0){
                            Video video = videos[ index ];
                            return GestureDetector(onTap: (){
                              FlutterYoutube.playYoutubeVideoById(apiKey: TOKEN,
                                  videoId: video.id,
                              autoPlay: true, fullScreen: true);
                            },
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8),
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage( video.image )
                                      )
                                  ),
                                ),
                                ListTile(
                                  title: Text( video.title ),
                                  subtitle: Text( video.channel ),
                                )
                              ],
                            ),);
                          }return Text("No data");

                        },
                        separatorBuilder: (context, index) => Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        itemCount: snapshot.data!.length
                    );
                }else{
                  return const Center(
                    child: Text("No data"),
                  );
                }
            }
        },
    );
  }
}
