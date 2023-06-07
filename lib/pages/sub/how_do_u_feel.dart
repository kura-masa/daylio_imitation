import 'dart:math';
import 'package:daylio_imitation/animation_paint/custom_painter.dart';
import 'package:flutter/material.dart';

import 'what_r_u_doing.dart';

class HowDoYouFeel extends StatefulWidget {
  const HowDoYouFeel({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  State<HowDoYouFeel> createState() => _HowDoYouFeelState();
}

class _HowDoYouFeelState extends State<HowDoYouFeel> {
  late List<bool> _selects = List.filled(5, true);
  @override
  Widget build(BuildContext context) {
    var green = Colors.green;
    var lgreen = Colors.lightGreen;
    var blue = Colors.blue;
    var orange = Colors.orange;
    var red = Colors.red;

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
                  child: Text(
                    '気分はどうですか？',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                // day & time
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: null,
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: green,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 0.6, color: green),
                              ),
                            ),
                            child: Text(
                              '今日、9月4日',
                              style: TextStyle(color: green, fontSize: 16),
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, color: green),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: null,
                      child: Row(
                        children: [
                          Icon(Icons.schedule, color: green),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 0.6, color: green),
                              ),
                            ),
                            child: Text(
                              '9:01',
                              style: TextStyle(color: green, fontSize: 16),
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, color: green),
                        ],
                      ),
                    ),
                  ],
                ),
                // mood icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    moodIcon(context, index: 0, text: '最高', color: green),
                    moodIcon(context, index: 1, text: '良い', color: lgreen),
                    moodIcon(context, index: 2, text: '普通', color: blue),
                    moodIcon(context, index: 3, text: '悪い', color: orange),
                    moodIcon(context, index: 4, text: '最低', color: red),
                  ],
                ),
              ],
            ),
          ),
          //back button
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 209, 207, 207),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  child: InkWell(
                    splashColor: Colors.grey[300],
                    onTap: () {
                      Navigator.pop(context);
                    },
                    customBorder: const CircleBorder(),
                    child: Ink(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Transform.rotate(
                        angle: 45 * pi / 180,
                        child: const Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 209, 207, 207),
                          size: 33,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Column moodIcon(BuildContext context,
      {required MaterialColor color,
      required String text,
      required int index}) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 80, 8, 2),
              child: Painter(
                index: index,
                selected: _selects[index],
                size: 55,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(8, 80, 8, 2),
              height: 55,
              width: 55,
              decoration: const BoxDecoration(
                  color: Colors.transparent, shape: BoxShape.circle),
              child: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    // ignore: avoid_print
                    print(_selects);
                    if (_selects.every((element) => true)) {
                      _selects = List.filled(5, true);
                    }
                    _selects[index] = !_selects[index];
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Wayd(index: index, uid: widget.uid),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Text(text, style: TextStyle(color: color, height: 1.7, fontSize: 16)),
      ],
    );
  }
}
