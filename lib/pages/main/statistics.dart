import 'dart:math';
import 'package:flutter/material.dart';

import '../base_app_bar.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const BaseAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                          offset: const Offset(
                              0, 0.5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(children: [
                      Row(
                        children: [
                          const Text(
                            '継続日数',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(child: Container()),
                          IconButton(
                            onPressed: () {
                              //do something
                            },
                            icon: const Icon(
                              Icons.share,
                              color: Color.fromARGB(255, 209, 207, 207),
                            ),
                          ),
                          Container(
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color.fromARGB(255, 209, 207, 207),
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                //do something
                              },
                              icon: const Icon(
                                Icons.more_horiz,
                                color: Color.fromARGB(255, 209, 207, 207),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 22, 5, 5),
                            height: 0.5,
                            width: 500,
                            color: Colors.grey,
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 5, 5, 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 209, 207, 207),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Transform.rotate(
                                      angle: 45 * pi / 180,
                                      child: const Icon(
                                        Icons.add,
                                        color:
                                            Color.fromARGB(255, 209, 207, 207),
                                        size: 33,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 5, 5),
                                    child: const Text(
                                      '日',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(8, 5, 5, 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 209, 207, 207),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Transform.rotate(
                                      angle: 45 * pi / 180,
                                      child: const Icon(
                                        Icons.add,
                                        color:
                                            Color.fromARGB(255, 209, 207, 207),
                                        size: 33,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 5, 5),
                                    child: const Text(
                                      '月',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(8, 5, 5, 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 209, 207, 207),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Transform.rotate(
                                      angle: 45 * pi / 180,
                                      child: const Icon(
                                        Icons.add,
                                        color:
                                            Color.fromARGB(255, 209, 207, 207),
                                        size: 33,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 5, 5),
                                    child: const Text(
                                      '火',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(8, 5, 5, 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 209, 207, 207),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Transform.rotate(
                                      angle: 45 * pi / 180,
                                      child: const Icon(
                                        Icons.add,
                                        color:
                                            Color.fromARGB(255, 209, 207, 207),
                                        size: 33,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 5, 5),
                                    child: const Text(
                                      '水',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    margin:
                                        const EdgeInsets.fromLTRB(8, 5, 5, 5),
                                    decoration: const BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Transform.rotate(
                                      angle: 0,
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 5, 5),
                                    child: const Text(
                                      '木',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 78,
                                    margin:
                                        const EdgeInsets.fromLTRB(8, 4, 0, 5),
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 3.5, 0, 3.5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 209, 207, 207),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: const Center(
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                            fontSize: 23, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 5, 5),
                                    child: const Text(
                                      '合計',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(color: Colors.grey),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.emoji_events,
                              color: Colors.orange,
                              size: 25,
                            ),
                            Container(width: 5),
                            const Text(
                              ('最長継続日数：１日'),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 131, 131, 131)),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 80, 80, 5),
                    height: 0.5,
                    width: 20,
                    color: Colors.grey,
                  ),
                ],
              ),
              Container(
                  height: 250,
                  width: 375,
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  margin: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        offset:
                            const Offset(0, 0.5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Text(
                    '気分チャート',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      );
}
