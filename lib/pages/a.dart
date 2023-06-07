import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:daylio_imitation/pages/entry.dart';
import 'package:flutter/material.dart';
import 'base_app_bar.dart';

class BookListPage extends StatefulWidget {
  final Function callback;
  const BookListPage(this.callback, {Key? key}) : super(key: key);

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _selected = true;
  double height = 58;
  double width = 58;
  double size = 28;
  List<Widget> pages = [];

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('books').snapshots();

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              return Stack(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                        child: Container(
                          height: 40,
                          decoration: _selected == false
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.grey),
                                )
                              : null,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
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
                                  padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                                  child: Icon(
                                    Icons.rocket_launch_rounded,
                                    color: Colors.grey,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    '今日の目標',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                ),
                                Expanded(child: Container()),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 20, 5),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {
                                      setState(() {
                                        _selected = !_selected;
                                      });
                                    },
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _selected,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                          child: ElevatedButton(
                            onPressed: () {
                              // do something
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              primary: Colors.white,
                              onPrimary: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
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
                                  child: const Icon(Icons.done,
                                      color: Colors.white),
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: Stack(
                          children: [
                            Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFCCFF90),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(children: [
                                Row(
                                  children: const [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(30, 5, 25, 5),
                                      child: Icon(
                                        Icons.trip_origin,
                                        size: 20,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text('今日, 8月11日'),
                                  ],
                                ),
                              ]),
                            ),
                            Column(
                              children: [
                                Container(height: 30),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)), //15
                                  ),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 5, 5, 5),
                                        child: Icon(
                                          Icons.face,
                                          size: 60,
                                          color: Colors.green,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          data['title'],
                                          style: const TextStyle(
                                              fontSize: 25,
                                              color: Colors.green),
                                        ),
                                      ),
                                      const Text(
                                        '15:30',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.green),
                                      ),
                                      Expanded(child: Container()),
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
                                          onPressed: () => widget.callback(),
                                          icon: const Icon(
                                            Icons.more_horiz,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Condition(
                                //   widget: widget,
                                //   text: '良い',
                                //   time: "16:33",
                                //   color: Colors.green,
                                // ),
                                // Condition(
                                //   widget: widget,
                                //   text: '良い',
                                //   time: "16:33",
                                //   color: Colors.green,
                                // ),
                                // Condition(
                                //   widget: widget,
                                //   text: '良い',
                                //   time: "16:33",
                                //   color: Colors.green,
                                // ),
                                // Condition(
                                //   widget: widget,
                                //   text: '良い',
                                //   time: "16:33",
                                //   color: Colors.green,
                                // ),
                                // Condition(
                                //   widget: widget,
                                //   text: '良い',
                                //   time: "16:33",
                                //   color: Colors.green,
                                // ),
                                // Container(
                                //   margin: const EdgeInsets.only(top: 10),
                                //   height: 300,
                                //   color: Colors.white,
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

// class Condition extends StatelessWidget {
//   const Condition({
//     Key? key,
//     required this.widget,
//     required this.text,
//     required this.color,
//     required this.time,
//   }) : super(key: key);

//   final Page1 widget;
//   final String text;
//   final Color color;
//   final String time;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {},
//       style: ElevatedButton.styleFrom(
//         primary: Colors.white,
//         onPrimary: Colors.grey,
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)), //15
//       ),
//       child: Row(
//         children: [
//           const Padding(
//             padding: EdgeInsets.fromLTRB(30, 5, 5, 5),
//             child: Icon(
//               Icons.face,
//               size: 60,
//               color: Colors.green,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               text,
//               style: TextStyle(fontSize: 25, color: color),
//             ),
//           ),
//           Text(
//             time,
//             style: TextStyle(fontSize: 15, color: color),
//           ),
//           Expanded(child: Container()),
//           Container(
//             height: 25,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(
//                 color: Colors.grey,
//               ),
//               shape: BoxShape.circle,
//             ),
//             child: IconButton(
//               padding: EdgeInsets.zero,
//               onPressed: () => widget.callback(),
//               icon: const Icon(
//                 Icons.more_horiz,
//                 color: Colors.grey,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
