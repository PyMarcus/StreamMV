import 'package:flutter/material.dart';


class Folder extends StatefulWidget {
  const Folder({Key? key}) : super(key: key);

  @override
  _FolderState createState() => _FolderState();
}

class _FolderState extends State<Folder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Folder"),
      ),
    );
  }
}
