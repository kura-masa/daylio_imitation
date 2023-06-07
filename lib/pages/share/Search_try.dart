import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daylio_imitation/pages/sub/search_text_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search_try extends StatefulWidget {
  const Search_try({super.key});

  @override
  State<Search_try> createState() => _Search_tryState();
}

class _Search_tryState extends State<Search_try> {
  String text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: InkWell(
          splashColor: Colors.white30,
          onTap: () => _search(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.search_rounded),
              Text("検索"),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                style: const TextStyle(
                  color: Colors.black54,
                ),
                controller: TextEditingController(text: ""),
                keyboardType: TextInputType.multiline,
                maxLength: 10,
                onChanged: (String value) {
                  text = value;
                },
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await _insertText(text);
                  text = "";
                  setState(() {});
                },
                child: const Text("名前登録"),
              ),
            ],
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

  _insertText(String text) async {
    final textOption = await _createTextOption(text);
    final FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      await db.collection("how").doc("epdPqBnct9O2pKN8MHGN").set({
        "index": 1,
        "text": text,
        "textOption": textOption,
      });
    } catch (e) {
      print("_insertText error ${e.toString()}");
    }
  }

  Future<List<String>> _createTextOption(String value) async {
    var text = value;
    var times = <int>[];
    //分割する文字数（かつ回数）を規定（大きい数順で２文字目まで）
    for (int i = text.length; i >= 1; i--) {
      times.add(i);
    }
    var textList = <String>[];
    for (int time in times) {
      //繰り返す回数
      for (int i = text.length; i >= 0; i--) {
        //１ずつ数字を減らしていく（１文字以上、名前の文字数以下の分割Gramが生成される）
        if (i + time <= text.length) {
          //文字数を超えて分割の後ろを指定できないので、if分で制御
          final getText = text.substring(i, i + time);
          textList.add(getText);
          text = value;
        }
      }
    }
    return textList;
  }
}

// class SearchTextDelegate extends SearchDelegate<String> {
//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     final theme = Theme.of(context);
//     return theme.copyWith(
//       brightness: Brightness.light,
//     );
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, "");
//       },
//     );
//   }

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = "";
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     if (query.isNotEmpty) {
//       return StreamBuilder(
//           stream: _searchText(query),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             return _results(context, snapshot);
//           });
//     } else {
//       return Container();
//     }
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     if (query.isNotEmpty) {
//       return StreamBuilder(
//           stream: _searchText(query),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             return _results(context, snapshot);
//           });
//     } else {
//       return Container();
//     }
//   }

//   Widget _results(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     print(snapshot.data);

//     return SingleChildScrollView(
//       child: !snapshot.hasData
//           ? const Center(child: Text("検索結果なし"))
//           : ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, int index) {
//                 final doc = snapshot.data!.docs[index];
//                 return ListTile(
//                   title: Text(
//                     doc["text"],
//                   ),
//                 );
//               }),
//     );
//   }

//   Stream<QuerySnapshot> _searchText(String queryString) {
//     final FirebaseFirestore db = FirebaseFirestore.instance;
//     return db
//         .collection("how")
//         .where("textOption", arrayContains: queryString)
//         .snapshots();
//   }
// }
