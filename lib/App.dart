import 'package:app_yt/search_delegate/CustomSearchDelegate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_yt/windows/Home.dart';
import 'package:app_yt/windows/Hot.dart';
import 'package:app_yt/windows/Subscriptions.dart';
import 'package:app_yt/windows/Folder.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  int _current_index = 0;
  String? response = '';

  @override
  Widget build(BuildContext context) {

    List<Widget> windows = [
      Home(response),
      Hot(),
      Subscriptions(),
      Folder(),
    ];


    return Scaffold(
      appBar: AppBar(
        title: Text("StreamMV"),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: ()async{
            String? _res = await showSearch(context: context, delegate: CustomSearchDelegate());
            setState(() {
              response = _res;
            });
          }, icon: Icon(Icons.search),),
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle))
        ],
        backgroundColor: Colors.deepPurpleAccent,
      ),


      body: Container(
        padding: EdgeInsets.all(16),
        child: windows[_current_index],
      ),

      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _current_index,
        onTap: (index){
          setState(() {
            _current_index = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.deepPurpleAccent,
        items: [
        BottomNavigationBarItem(label: "Home",icon: Icon(Icons.home), backgroundColor: Colors.grey[350]),
        BottomNavigationBarItem(label: "Hot", icon: Icon(Icons.whatshot),backgroundColor:Colors.grey[350]),
        BottomNavigationBarItem(label: "Subscriptions", icon: Icon(Icons.subscriptions),backgroundColor:Colors.grey[350]),
        BottomNavigationBarItem(label: "Folder", icon: Icon(Icons.folder),backgroundColor:Colors.grey[350]),
      ],),

    );
  }
}
