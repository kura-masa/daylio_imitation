import 'package:daylio_imitation/animation_paint/custom_painter.dart';
import 'package:daylio_imitation/pages/sub/how_do_u_feel.dart';
import 'package:flutter/material.dart';

import '../base_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Page1 extends StatefulWidget {
  final Function callback;

  const Page1(this.callback, {Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 150), //アニメーションの時間
      vsync: this,
    );

    _controller.addListener(() {
      setState(() {});
    });
  }

  // Dispose the controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double height = 58;
  double width = 58;
  double size = 28;
  double radius = 15;
  bool _selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  // visibile or not
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Container(
                      height: 40,
                      decoration: _selected == false
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: Colors.transparent,
                              border: Border.all(color: Colors.grey),
                            )
                          : null,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(radius),
                        onTap: _selected == false
                            ? () {
                                setState(
                                  () {
                                    _selected = !_selected;
                                  },
                                );
                              }
                            : null,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                              child: Icon(
                                Icons.rocket_launch_rounded,
                                color: Colors.grey,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                '今日の目標',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ),
                            Expanded(child: Container()),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(radius),
                                onTap: () {
                                  setState(() {
                                    _selected = !_selected;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: _selected == true
                                      ? const Text(
                                          '表示しない',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.green),
                                        )
                                      : const Text(
                                          '表示する',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.green),
                                        ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // goal
                  Visibility(
                    visible: _selected,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          // do something
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          primary: Colors.white,
                          onPrimary: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(radius)),
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {
                                // do something
                              },
                              child:
                                  const Icon(Icons.done, color: Colors.white),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(Icons.hotel,
                                color: Colors.green, size: 35),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: const [
                                Text(
                                  '8時間寝る',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                Text(
                                  '1日間の継続',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                            child: Icon(Icons.arrow_forward_ios,
                                color: Colors.grey),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  // header of mood listView
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFCCFF90),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(radius),
                        topLeft: Radius.circular(radius),
                      ),
                    ),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(30, 5, 25, 5),
                              child: Icon(
                                Icons.trip_origin,
                                size: 20,
                                color: Colors.green,
                              ),
                            ),
                            Text('今日, 8月11日'),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  // mood listView
                  StreamBuilder<QuerySnapshot>(
                    // 指定したstreamにデータが流れてくると再描画される
                    stream: FirebaseFirestore.instance
                        .collection('how')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Loading");
                      }
                      return snapshot.hasData
                          ? ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              // if nulを書く？
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data() as Map<String, dynamic>;
                                data['docId'] = document.id;

                                return Stack(
                                  children: [
                                    Condition(
                                      widget: widget,
                                      index: data['index'],
                                      docId: data['docId'],
                                      time: "16:33",
                                      text: data['text'] ?? '',
                                    ),
                                  ],
                                );
                              }).toList(),
                            )
                          : const Text("Loading");
                    },
                  ),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Condition extends StatefulWidget {
  const Condition({
    Key? key,
    required this.widget,
    required this.time,
    required this.index,
    required this.docId,
    required this.text,
  }) : super(key: key);

  final Page1 widget;
  final String time;
  final int index;
  final String docId;
  final String text;

  @override
  State<Condition> createState() => _ConditionState();
}

class _ConditionState extends State<Condition> {
  final GlobalKey _key = GlobalKey();
  bool selected = false;
  _getPositions() {
    final RenderBox renderBox =
        _key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    return position;
  }

  _afterLayout(_) {
    _getPositions();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var i = widget.index;
    var green = Colors.green, lgreen = Colors.lightGreen;
    var blue = Colors.blue, orange = Colors.orange;
    var red = Colors.red;
    List<String> mood = ['最高', '良い', '普通', '悪い', '最低'];
    List<Color> color = [green, lgreen, blue, orange, red];
    double y = 0;

    return ElevatedButton(
      key: _key,
      onPressed: () {
        y = _getPositions().dy;
        showDialog(
          barrierColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              contentPadding: const EdgeInsets.all(0),
              insetPadding: (height - y < 195)
                  ? EdgeInsets.fromLTRB(150, height - 230, 50, 0)
                  : EdgeInsets.fromLTRB(150, y, 50, height - y - 180),
              backgroundColor: Colors.transparent,
              elevation: 1,
              children: [
                // edit
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    maximumSize: const Size(70, 50),
                    minimumSize: const Size(70, 50),
                    primary: Colors.white,
                    onPrimary: Colors.grey,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    )),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HowDoYouFeel(uid: widget.docId),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '編集',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
                // delete
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    maximumSize: const Size(100, 50),
                    minimumSize: const Size(100, 50),
                    primary: Colors.white,
                    onPrimary: Colors.grey,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    )),
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('how')
                        .doc(widget.docId)
                        .delete();
                    Navigator.of(context).pop();
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '削除',
                      style: TextStyle(color: red, fontSize: 18),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        maximumSize: widget.text.isEmpty ? Size(width, 70) : Size(width, 80),
        minimumSize: widget.text.isEmpty ? Size(width, 70) : Size(width, 80),
        primary: Colors.white,
        onPrimary: Colors.grey,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                // bottomRight: Radius.circular(15),
                // bottomLeft: Radius.circular(15),
                )),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // mood icon
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Painter(index: i, selected: true, size: 45),
              ),
              // mood text
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  mood[i],
                  style: TextStyle(
                    fontSize: 23,
                    color: color[i],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // time
              Text(
                widget.time,
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Expanded(child: Container()),
              // others
              Container(
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => widget.widget.callback(),
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: widget.text.isNotEmpty,
            child: Text(
              widget.text,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
