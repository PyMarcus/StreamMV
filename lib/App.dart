import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamMV"),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle))
        ],
        backgroundColor: Colors.deepPurpleAccent,
      ),


      body: Container(),

    );
  }
}
