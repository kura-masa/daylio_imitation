import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'dart:io';

class SearchTextDelegate extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.black),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.green),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return StreamBuilder(
          stream: _searchText(query),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return _results(context, snapshot);
          });
    } else {
      return Container();
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      return StreamBuilder(
          stream: _searchText(query),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return _results(context, snapshot);
          });
    } else {
      return Container();
    }
  }

  Widget _results(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    print(snapshot.data);

    return SingleChildScrollView(
      child: !snapshot.hasData
          ? const Center(child: Text("検索結果なし"))
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, int index) {
                final doc = snapshot.data!.docs[index];
                return ListTile(
                  onTap: () {
                    // TODO
                  },
                  title: Text(
                    doc["text"],
                  ),
                );
              }),
    );
  }

  Stream<QuerySnapshot> _searchText(String queryString) {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    return db
        .collection("how")
        .where("textOption", arrayContains: queryString)
        .snapshots();
  }
}
