import 'package:flutter/material.dart';


class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        query = "";
      }, icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, query);
    }, icon: Icon(Icons.arrow_back),);
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String>? suggestions = [];
    if (query.isNotEmpty) {
      suggestions = [
        "Cars", "Money", "News", "Games", "Movies", "Sports", "Space"
      ].where(
          (text) => text.toLowerCase().startsWith(query.toLowerCase())
      ).toList();

      return ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          onTap: (){
            print(suggestions![index]);
            close(context, suggestions![index]);
          },
          title: Text(suggestions![index]),
        );
      },
        itemCount: suggestions.length,);
    }

    return Center(child: Text(
      "No results", style: TextStyle(color: Colors.deepPurpleAccent),));
  }
}

