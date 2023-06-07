// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daylio_imitation/animation_paint/custom_painter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../share/sleep_icons.dart';

class Wayd extends StatefulWidget {
  Wayd({Key? key, required this.index, this.uid}) : super(key: key);
  final int index;
  final String? uid;

  @override
  State<Wayd> createState() => _WaydState();
}

class _WaydState extends State<Wayd> {
  final List<bool> _selectedSleepIcon = List.filled(4, true);

  String text = "";

  @override
  Widget build(BuildContext context) {
    var green = Colors.green;
    var white = Colors.white;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 3,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            // back button
            InkWell(
              borderRadius: BorderRadius.circular(10.0),
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: green),
                    Painter(index: widget.index, selected: false, size: 30),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            // save button
            InkWell(
              borderRadius: BorderRadius.circular(10.0),
              onTap: () async {
                Navigator.pop(context);
                Navigator.pop(context);
                await _insertText(text);
                text = "";
                // setState(() {});

                // if (widget.uid == null || widget.uid == "a") {
                //   //uidが入ってるとaになる現象がある
                //   FirebaseFirestore.instance
                //       .collection('how')
                //       .doc()
                //       .set({'index': widget.index});
                // } else {
                //   FirebaseFirestore.instance
                //       .collection('how')
                //       .doc(widget.uid)
                //       .set({'index': widget.index});
                // }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Icon(Icons.done, color: white, size: 20),
                    ),
                    Text(
                      '保存する',
                      style: TextStyle(color: green, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                '何をしていますか？',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                SleepIcons(
                    addButton: true, selectedSleepIcon: _selectedSleepIcon),
                Row(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.description, color: Colors.grey[600]),
                      const Text(
                        'クイックメモ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    'フルメモを開く',
                    style: TextStyle(fontWeight: FontWeight.bold, color: green),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    onChanged: (String value) {
                      text = value;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _insertText(String text) async {
    final textOption = await _createTextOption(text);
    final FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      if (widget.uid == null || widget.uid == "a") {
        //uidが入ってるとaになる現象がある
        await db.collection('how').doc().set({
          'index': widget.index,
          "text": text,
          "textOption": textOption,
        });
      } else {
        await db.collection('how').doc(widget.uid).set({
          'index': widget.index,
          "text": text,
          "textOption": textOption,
        });
      }
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
