import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daylio_imitation/animation_paint/custom_painter.dart';
import 'package:daylio_imitation/pages/sub/search_text_delegate.dart';
import 'package:flutter/material.dart';

import '../share/sleep_icons.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<int> _searchIndexList = [];

  final List<String> _list = [
    'English Textbook',
    'Japanese Textbook',
    'English Vocabulary',
    'Japanese Vocabulary'
  ];

  Widget _searchTextField() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.15),
        ),
        child: TextField(
          onChanged: (String s) {
            setState(() {
              _searchIndexList = [];
              for (int i = 0; i < _list.length; i++) {
                if (_list[i].contains(s)) {
                  _searchIndexList.add(i);
                }
              }
            });
          },
          autofocus: true,
          cursorColor: Colors.black,
          cursorWidth: 1,
          style: const TextStyle(color: Colors.black, fontSize: 20),
          textInputAction: TextInputAction.search,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            icon: Icon(Icons.search_rounded, color: Colors.grey),
            hintText: '検索',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  _search(BuildContext context) async {
    final text = await showSearch(
      context: context,
      delegate: SearchTextDelegate(),
    );
    if (text != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        scrolledUnderElevation: 1,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            // back button
            InkWell(
              splashColor: Colors.grey[300],
              onTap: () {
                _search(context);
                // Navigator.pop(context);
              },
              child: SizedBox(
                width: 40,
                height: 40,
                child: Icon(Icons.west, color: Colors.green[300], size: 28),
              ),
            ),
            _searchTextField(),
            Icon(
              Icons.clear,
              color: Colors.green[300],
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: _searchIndexList.length,
          itemBuilder: (context, index) {
            index = _searchIndexList[index];
            return Card(child: ListTile(title: Text(_list[index])));
          }),
    );
  }
}
