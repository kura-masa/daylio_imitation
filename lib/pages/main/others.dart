import 'dart:math';
import 'package:daylio_imitation/pages/sub/remove_ads.dart';
import 'package:daylio_imitation/screens/authenticate/sign_in.dart';
import 'package:daylio_imitation/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';
import 'package:switcher_button/switcher_button.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final AuthService _auth = AuthService();
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    double iconSize = 63;
    double blackCircleSize = 50;
    double hexSize = 105;
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.white,
    //     title: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         // remove ads icon
    //         Container(
    //           decoration: const BoxDecoration(
    //             shape: BoxShape.circle,
    //           ),
    //           child: Material(
    //             color: Colors.transparent,
    //             shape: const CircleBorder(),
    //             child: InkWell(
    //               splashColor: Colors.grey[300],
    //               onTap: () {
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) => const RemoveAds(),
    //                       fullscreenDialog: true,
    //                     ));
    //               },
    //               customBorder: const CircleBorder(),
    //               child: Ink(
    //                 decoration: const BoxDecoration(shape: BoxShape.circle),
    //                 child: Image.asset(
    //                   '/Users/K/Desktop/Daylio/assets/images/remove_ad.png',
    //                   width: 30,
    //                   height: 30,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         const Text(
    //           'その他',
    //           style: TextStyle(color: Colors.black, fontSize: 20),
    //         ),
    //         const SizedBox(width: 30.0),
    //       ],
    //     ),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         Stack(
    //           children: [
    //             Container(
    //               margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    //               height: 80,
    //               child: ElevatedButton(
    //                   onPressed: () {},
    //                   style: ElevatedButton.styleFrom(
    //                     primary: Colors.white,
    //                     onPrimary: Colors.grey,
    //                     elevation: 0,
    //                   ),
    //                   child: Row(
    //                     children: [
    //                       const SizedBox(width: 90),
    //                       Expanded(
    //                         child: Padding(
    //                           padding: const EdgeInsets.fromLTRB(1, 3, 15, 0),
    //                           child: Column(
    //                             children: [
    //                               Align(
    //                                 alignment: Alignment.centerLeft,
    //                                 child: Text(
    //                                   '無料版',
    //                                   style: TextStyle(
    //                                     color: Colors
    //                                         .teal[400], //greenAccent[700],
    //                                     fontSize: 18,
    //                                     fontWeight: FontWeight.bold,
    //                                   ),
    //                                 ),
    //                               ),
    //                               const Text(
    //                                 'すべての基本機能（期間無制限）',
    //                                 style: TextStyle(
    //                                   color: Colors.black,
    //                                   fontSize: 16,
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                       Icon(
    //                         Icons.arrow_forward_ios,
    //                         color: Colors.teal[400],
    //                         size: 18,
    //                       )
    //                     ],
    //                   )),
    //             ),
    //             Transform.rotate(
    //               angle: pi / 2,
    //               child: Icon(
    //                 Icons.hexagon_rounded,
    //                 color: Colors.greenAccent.shade700,
    //                 size: hexSize,
    //               ),
    //             ),
    //             Container(
    //               width: blackCircleSize,
    //               height: blackCircleSize,
    //               margin: EdgeInsets.all((hexSize - blackCircleSize) / 2),
    //               decoration: BoxDecoration(
    //                 color: Colors.black,
    //                 shape: BoxShape.circle,
    //                 boxShadow: [
    //                   BoxShadow(
    //                       color: Colors.grey.withOpacity(0.5),
    //                       spreadRadius: 5,
    //                       blurRadius: 7,
    //                       offset: const Offset(0, 3)),
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.all((hexSize - iconSize) / 2),
    //               child: InvertColors(
    //                 child: Icon(
    //                   Icons.tag_faces_rounded,
    //                   // Icons.emoji_emotions_rounded,
    //                   color: Colors.black,
    //                   size: iconSize,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         Others(icon: Icons.flag, color: Colors.teal[400], text: '目標'),
    //         Others(
    //             icon: Icons.stacked_bar_chart_outlined,
    //             color: Colors.red[600],
    //             text: 'フォトギャラリー'),
    //         const SizedBox(height: 20),
    //         Others(
    //             icon: Icons.collections, color: Colors.teal[400], text: '目標'),
    //         Others(
    //           icon: Icons.emoji_events_rounded,
    //           color: Colors.red[600],
    //           text: '称号',
    //         ),
    //         const SizedBox(height: 20),
    //         Container(
    //           height: 50,
    //           color: Colors.white,
    //           padding: const EdgeInsets.symmetric(horizontal: 16.5),
    //           child: Row(children: [
    //             Stack(
    //               children: [
    //                 Container(
    //                   width: 30,
    //                   height: 30,
    //                   decoration: BoxDecoration(
    //                     color: Colors.lightGreen[600],
    //                     shape: BoxShape.circle,
    //                   ),
    //                 ),
    //                 const Padding(
    //                   padding: EdgeInsets.all(5.0),
    //                   child: Icon(Icons.notifications,
    //                       color: Colors.white, size: 20),
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(width: 15),
    //             const Text(
    //               'リマインダー',
    //               style: TextStyle(color: Colors.black, fontSize: 18),
    //             ),
    //             Expanded(child: Container()),
    //             SwitcherButton(
    //               size: 40,
    //               onColor: (Colors.grey[400])!,
    //               offColor: Colors.grey,
    //               value: isSwitched,
    //               onChange: (value) {
    //                 setState(() {
    //                   isSwitched = value;
    //                 });
    //               },
    //             ),
    //           ]),
    //         ),
    //         Visibility(
    //           visible: isSwitched,
    //           child: Others(
    //             icon: Icons.schedule,
    //             color: Colors.orange[600],
    //             text: 'リマインダーの時刻',
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         Others(icon: Icons.flag, color: Colors.teal[400], text: '目標'),
    //         Others(icon: Icons.flag, color: Colors.teal[400], text: '目標'),
    //         Others(icon: Icons.flag, color: Colors.teal[400], text: '目標'),
    //         Others(icon: Icons.flag, color: Colors.teal[400], text: '目標'),
    //         Others(icon: Icons.flag, color: Colors.teal[400], text: '目標'),
    //         Others(icon: Icons.flag, color: Colors.teal[400], text: '目標'),
    //         Others(icon: Icons.flag, color: Colors.teal[400], text: '目標'),
    //       ],
    //     ),
    //   ),
    // );

    // flutter tips (delete)
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          width: 600,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.lightGreen,
              side: const BorderSide(width: 20.0, color: Colors.purple),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
            child: const Text(
              '''Elevated Button''',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),

          // circle button
          // child: ElevatedButton(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(
          //     primary: Colors.purple,
          //     side: const BorderSide(width: 20.0, color: Colors.lightGreen),
          //   ),
          //   child: const Text(
          //     '''Elevated Button''',
          //     style: TextStyle(color: Colors.white, fontSize: 40),
          //   ),
          // ),

          // child: ElevatedButton(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(
          //       side: const BorderSide(color: Colors.green)),
          //   child: const Text('''Elevated Button'''),
          // ),
        ),
      ),
    );
  }
}

class Others extends StatelessWidget {
  const Others({
    Key? key,
    required this.color,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final Color? color;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.grey,
          elevation: 0,
        ),
        onPressed: () async {
          await AuthService().signOut();
        },
        child: Row(children: [
          Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ]),
      ),
    );
  }
}
