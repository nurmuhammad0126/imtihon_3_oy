import 'package:flutter/material.dart';

class SearchViewDelegate extends SearchDelegate<Map> {
  final List<Map> data;

  SearchViewDelegate({
    required this.data,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, {});
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Natija ekrani hozirgi sahifada qolish uchun
    final suggestionList = data
        .where(
          (element) =>
              element["name"].toLowerCase().contains(query.toLowerCase()) ||
              element["year"]
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()),
        )
        .toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext ctx, int index) {
        return ListTile(
          title: Text(suggestionList[index]["name"]),
          subtitle: Text(
            suggestionList[index]["year"].toString(),
          ),
          onTap: () {
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Qidiruv natijalari shu sahifada qolib ko‘rsatiladi
    final suggestionList = query.isEmpty
        ? []
        : data
            .where(
              (element) =>
                  element["name"].toLowerCase().contains(query.toLowerCase()) ||
                  element["year"]
                      .toString()
                      .toLowerCase()
                      .contains(query.toLowerCase()),
            )
            .toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext ctx, int index) {
        return ListTile(
          title: Text(suggestionList[index]["name"]),
          subtitle: Text(
            suggestionList[index]["year"].toString(),
          ),
          onTap: () {
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}
