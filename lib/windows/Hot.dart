import 'package:flutter/material.dart';


class Hot extends StatefulWidget {
  const Hot({Key? key}) : super(key: key);

  @override
  _HotState createState() => _HotState();
}

class _HotState extends State<Hot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Hot"),
      ),
    );
  }
}
