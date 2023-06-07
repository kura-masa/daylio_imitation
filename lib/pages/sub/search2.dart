import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daylio_imitation/animation_paint/custom_painter.dart';
import 'package:flutter/material.dart';

import '../share/sleep_icons.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool _selectedMood = true;
  bool _selectedActivity = true;
  final List<bool> _selectedSleepIcon = List.filled(4, true);
  final List<bool> _selectedMoodIcon = List.filled(5, true);
  String text = "";

  @override
  Widget build(BuildContext context) {
    var white = Colors.white;
    var green = Colors.green;
    var lgreen = Colors.lightGreen;

    var condition1 = !_selectedSleepIcon[0] ||
        !_selectedSleepIcon[1] ||
        !_selectedSleepIcon[2] ||
        !_selectedSleepIcon[3];
    var condition2 = !_selectedMoodIcon[0] ||
        !_selectedMoodIcon[1] ||
        !_selectedMoodIcon[2] ||
        !_selectedMoodIcon[3] ||
        !_selectedMoodIcon[4];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        scrolledUnderElevation: 1,
        backgroundColor: white,
        title: Row(
          children: <Widget>[
            // back button
            InkWell(
              splashColor: Colors.grey[300],
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.west, color: green, size: 28),
                  const SizedBox(width: 10),
                  // const Text('検索', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            Expanded(
              child: InkWell(
                splashColor: Colors.white30,
                onTap: () => _search(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.search_rounded, color: Colors.grey),
                    Text("検索", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // search bar ノートを検索...
                  // Container(
                  //   height: 70,
                  //   color: white,
                  //   padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  //   child: TextField(
                  //     cursorColor: Colors.black,
                  //     cursorWidth: 0.8,
                  //     style: const TextStyle(color: Colors.black),
                  //     autofocus: true,
                  //     decoration: InputDecoration(
                  //       filled: true,
                  //       fillColor: const Color.fromARGB(30, 158, 158, 158),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(8.0),
                  //         borderSide: BorderSide.none,
                  //       ),
                  //       hintText: "ノートを検索...",
                  //       hintStyle: const TextStyle(fontSize: 18, height: 2.65),
                  //       prefixIcon: const Icon(
                  //         Icons.search,
                  //         color: Colors.grey,
                  //       ),
                  //       focusColor: Colors.black,
                  //       prefixIconColor: Colors.grey,
                  //     ),
                  //   ),
                  // ),
                  // // buttons of mood and activity  気分　アクティビティ
                  Container(
                    color: white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // mood button 気分
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: _selectedMood ? white : green,
                              onPrimary: _selectedMood ? white : green,
                              shadowColor: Colors.transparent,
                              side: BorderSide(color: green),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              setState(() {
                                // _selected = !_selected;
                                _selectedMood = !_selectedMood;
                              });
                            },
                            child: Text(
                              _selectedMood ? '+気分' : '-気分',
                              style: TextStyle(
                                color: !_selectedMood ? white : green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 1.25,
                              ),
                            ),
                          ),
                        ),
                        // activity button アクティビティ
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: _selectedActivity ? white : green,
                              onPrimary: _selectedActivity ? white : green,
                              shadowColor: Colors.transparent,
                              side: BorderSide(color: green),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              setState(() {
                                // _selected = !_selected;
                                _selectedActivity = !_selectedActivity;
                              });
                            },
                            child: Text(
                              _selectedActivity ? '+アクティビティ' : '-アクティビティ',
                              style: TextStyle(
                                color: !_selectedActivity ? white : green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 1.25,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                  // mood
                  Visibility(
                    visible: !_selectedMood,
                    child: Container(
                      color: white,
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          moodIcon(index: 0, color: green, text: '最高'),
                          moodIcon(index: 1, color: lgreen, text: '良い'),
                          moodIcon(index: 2, color: Colors.blue, text: 'ふつう'),
                          moodIcon(index: 3, color: Colors.orange, text: '悪い'),
                          moodIcon(index: 4, color: Colors.red, text: '最低'),
                        ],
                      ),
                    ),
                  ),
                  // activities
                  Visibility(
                    visible: !_selectedActivity,
                    child: Container(
                      color: white,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: SleepIcons(
                          addButton: false,
                          selectedSleepIcon: _selectedSleepIcon),
                    ),
                  ),

                  // image 画像
                  const SizedBox(height: 100),
                  Visibility(
                    visible: _selectedMood & _selectedActivity,
                    child: Image.asset(
                      '/Users/K/Desktop/Daylio/assets/images/hiker.png',
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // search bar 検索
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Stack(
                children: [
                  // search bar 検索
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      primary: condition1 || condition2
                          ? green
                          : const Color.fromARGB(255, 39, 91, 41),
                      onPrimary: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {},
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color:
                                condition1 || condition2 ? white : Colors.grey,
                            size: 28,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '検索',
                            style: TextStyle(
                              color: condition1 || condition2
                                  ? white
                                  : Colors.grey,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // able tap or disable
                  Visibility(
                    visible: !(condition1 || condition2),
                    child: Container(color: Colors.transparent),
                  ),
                ],
              ),
            ),
          ),
        ],
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

  Column moodIcon(
      {required String text,
      required MaterialColor color,
      required int index}) {
    // // background color's condition
    // var condition1 = !_selectedMoodIcon[index] ? color : Colors.transparent;
    // // circle border color's condition
    // var condition2 = _selectedMoodIcon[index] ? color : Colors.transparent;
    return Column(
      children: [
        Stack(
          children: [
            Painter(
              index: index,
              selected: _selectedMoodIcon[index],
              size: 47,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    for (var i = 0; i < 5; i++) {
                      if (index == i) {
                        _selectedMoodIcon[i] = !_selectedMoodIcon[i];
                      }
                    }
                  });
                },
              ),
            ),
          ],
        ),
        Text(text,
            style: TextStyle(
                color: _selectedMoodIcon[index] ? color : color,
                height: 1.7,
                fontSize: 16)),
      ],
    );
  }
}

class SearchTextDelegate extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      brightness: Brightness.light,
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
