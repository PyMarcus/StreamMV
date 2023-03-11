import 'package:flutter/material.dart';

import '../api/Api.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    Api api = Api();
    api.search('');

    return Container(
      child: Center(
        child: Text("Home"),
      ),
    );
  }
}
