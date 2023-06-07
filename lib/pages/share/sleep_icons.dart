import 'dart:math';

import 'package:flutter/material.dart';

class SleepIcons extends StatefulWidget {
  const SleepIcons({
    Key? key,
    required selectedSleepIcon,
    required this.addButton,
  })  : _selectedSleepIcon = selectedSleepIcon,
        super(key: key);

  final List<bool> _selectedSleepIcon;
  final bool addButton;

  @override
  State<SleepIcons> createState() => _SleepIconsState();
}

class _SleepIconsState extends State<SleepIcons> {
  bool _selectedSleepArrow = true;
  @override
  Widget build(BuildContext context) {
    var condition1 = !widget._selectedSleepIcon[0] ||
        !widget._selectedSleepIcon[1] ||
        !widget._selectedSleepIcon[2] ||
        !widget._selectedSleepIcon[3];
    var grey = Colors.grey;
    var green = Colors.green;
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: grey,
        ),
      ),
      child: Column(
        children: [
          // header of sleep
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedSleepArrow = !_selectedSleepArrow;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        '睡眠',
                        style: TextStyle(fontSize: 16),
                      ),
                      Visibility(
                        visible: condition1,
                        child: Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: green, shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        if (widget.addButton)
                          circleIcon(index: 5, grey: grey, text: ''),
                        circleIcon(index: 4, grey: grey, text: ''),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // sleep icons 睡眠
          Visibility(
            visible: _selectedSleepArrow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: circleIcon(index: 0, grey: grey, text: '早寝'),
                ),
                circleIcon(index: 1, grey: grey, text: '安眠'),
                circleIcon(index: 2, grey: grey, text: '普通'),
                circleIcon(index: 3, grey: grey, text: '不眠'),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // activity sleep icon
  Padding circleIcon({
    required Color grey,
    required int index,
    required String text,
  }) {
    var green = Colors.green;
    var white = Colors.white;
    double bedIconSize = 55;
    return Padding(
      padding: EdgeInsets.only(top: index != 0 ? 10.0 : 0),
      child: Column(
        children: [
          // icon button
          Container(
            height: index == 4 || index == 5 ? 30 : bedIconSize,
            width: index == 4 || index == 5 ? 30 : bedIconSize,
            margin: index == 4 || index == 5 ? const EdgeInsets.all(10) : null,
            child: Stack(
              children: [
                // turn on the green
                Container(
                  decoration: BoxDecoration(
                    color: (index != 4 &&
                            index != 5 &&
                            !widget._selectedSleepIcon[index])
                        ? green
                        : null,
                    shape: BoxShape.circle,
                    border: Border.all(color: grey),
                  ),
                ),
                // bed icon
                Visibility(
                  visible: index != 4 && index != 5,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Icon(
                        Icons.hotel,
                        color: (index != 4 &&
                                index != 5 &&
                                !widget._selectedSleepIcon[index])
                            ? white
                            : green,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                // clock icon
                Visibility(
                  visible: index == 0 ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.av_timer,
                        size: 15,
                        color: (index != 4 &&
                                index != 5 &&
                                !widget._selectedSleepIcon[index])
                            ? white
                            : green,
                      ),
                    ),
                  ),
                ),
                // zzz icon
                Visibility(
                  visible: index == 1 ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 9.0),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'zzz',
                          style: TextStyle(
                            color: (index != 4 &&
                                    index != 5 &&
                                    !widget._selectedSleepIcon[index])
                                ? white
                                : green,
                            fontSize: 11,
                          ),
                        )),
                  ),
                ),
                // wake up icon
                Visibility(
                  visible: index == 3 ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Transform.rotate(
                        angle: pi / 4,
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: (index != 4 &&
                                  index != 5 &&
                                  !widget._selectedSleepIcon[index])
                              ? white
                              : green,
                        ),
                      ),
                    ),
                  ),
                ),
                // add button
                Visibility(
                  visible: index == 5,
                  child: Center(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey[300],
                        onTap: () {
                          setState(() {
                            if (index == 4) {
                              _selectedSleepArrow = !_selectedSleepArrow;
                            } else if (index != 5) {
                              widget._selectedSleepIcon[index] =
                                  !widget._selectedSleepIcon[index];
                            }
                          });
                        },
                        customBorder: const CircleBorder(),
                        child: Ink(
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Icon(Icons.add, color: green),
                        ),
                      ),
                    ),
                  ),
                ),

                // bending button
                Container(
                  height: index == 4 ? 30 : bedIconSize,
                  width: index == 4 ? 30 : bedIconSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: grey),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.grey[300],
                      onTap: () {
                        setState(() {
                          if (index == 4) {
                            _selectedSleepArrow = !_selectedSleepArrow;
                          } else if (index != 5) {
                            widget._selectedSleepIcon[index] =
                                !widget._selectedSleepIcon[index];
                          }
                        });
                      },
                      customBorder: const CircleBorder(),
                      child: Ink(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: (index == 4 && _selectedSleepArrow)
                            ? Icon(
                                Icons.keyboard_arrow_up,
                                color: green,
                              )
                            : (index == 4 && !_selectedSleepArrow)
                                ? Icon(
                                    Icons.keyboard_arrow_down,
                                    color: green,
                                  )
                                : null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // text
          Visibility(
            visible: index != 4 && index != 5 ? true : false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 20),
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}
