// import 'package:daylio/gab2.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:daylio_imitation/animation_paint/animation.dart';
import 'package:daylio_imitation/pages/main/calendar.dart';
import 'package:daylio_imitation/pages/main/entry.dart';
import 'package:daylio_imitation/pages/main/others.dart';
import 'package:daylio_imitation/pages/main/statistics.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _rotateAnimation;
  late Animation<Offset> _offsetAnimation1,
      _offsetAnimation2,
      _offsetAnimation3;

  List<Widget> pages = [];

  int activeIndex = 0;
  int animeTime = 150;
  double height = 58;
  double width = 58;
  double size = 28;
  bool selected = false;

  void changeActivePage(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  Tween<Offset> slideAnimation({required double dx, required double dy}) {
    return Tween<Offset>(
      begin: const Offset(2.9, 13.4),
      end: Offset(dx, dy),
    );
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: animeTime),
      vsync: this,
    );

    controller.addListener(() {
      setState(() {});
    });

    var curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack,
    );

    _offsetAnimation1 =
        slideAnimation(dx: 1.1, dy: 12.2).animate(curvedAnimation);
    _offsetAnimation2 =
        slideAnimation(dx: 2.9, dy: 11.2).animate(curvedAnimation);
    _offsetAnimation3 =
        slideAnimation(dx: 4.8, dy: 12.2).animate(curvedAnimation);

    _rotateAnimation = Tween<double>(
      begin: 0,
      end: 3 / 4 * pi,
    ).animate(controller);

    pages = [
      Page1(() => changeActivePage(2)),
      // BookListPage(() => changeActivePage(2)),
      const Page2(),
      const Page3(),
      const Page4(),
    ];
  }

  // Dispose the controller
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          body: pages[activeIndex],
          bottomNavigationBar: Container(
            color: Colors.greenAccent[700],
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bottomIcon(page: 0, name: 'エントリー', icon: Icons.event_note),
                bottomIcon(page: 1, name: '統計', icon: Icons.bar_chart),
                Container(width: 60),
                bottomIcon(
                    page: 2,
                    name: 'カレンダー',
                    icon: Icons.calendar_month_outlined),
                bottomIcon(page: 3, name: 'その他', icon: Icons.more_horiz),
              ],
            ),
          ),
        ),
        // add button
        Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              Visibility(
                visible: selected,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: animeTime),
                  opacity: selected ? 1.0 : 0.0,
                  child: SizedBox(
                    width: screenWidth,
                    height: screenHeight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        shadowColor: Colors.black.withOpacity(1),
                        primary: Colors.black.withOpacity(0.1),
                      ),
                      onPressed: () {
                        selected = !selected;
                        controller.reverse();
                      },
                      child: null,
                    ),
                  ),
                ),
              ),
              IconSlide(
                id: 1,
                offsetAnimation1: _offsetAnimation1,
                height: height,
                width: width,
                icon: Icons.arrow_back,
                size: size,
                color: const Color.fromARGB(255, 16, 163, 134),
              ),
              IconSlide(
                id: 2,
                offsetAnimation1: _offsetAnimation2,
                height: height,
                width: width,
                icon: Icons.schedule,
                size: size,
                color: const Color.fromARGB(255, 73, 171, 252),
              ),
              IconSlide(
                id: 3,
                offsetAnimation1: _offsetAnimation3,
                height: height,
                width: width,
                icon: Icons.calendar_month_outlined,
                size: size,
                color: const Color.fromARGB(255, 235, 148, 17),
              ),
              TextAnimation(
                animeTime: animeTime,
                selected: selected,
                marginL: screenWidth / 5,
                marginT: screenHeight - 75,
                name: '昨日',
              ),
              TextAnimation(
                animeTime: animeTime,
                selected: selected,
                marginL: screenWidth / 2 - 13,
                marginT: screenHeight - 133,
                name: '今日',
              ),
              TextAnimation(
                animeTime: animeTime,
                selected: selected,
                marginL: screenWidth - 105,
                marginT: screenHeight - 75,
                name: '他の日',
              ),

              // add button
              Container(
                margin: EdgeInsets.fromLTRB(
                    screenWidth / 2 - 30, screenHeight - 70, 0, 0),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(1000),
                  ),
                  border: Border.all(
                    color: const Color.fromARGB(255, 99, 204, 102),
                    width: 2.5,
                  ), //
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black, //New
                      blurRadius: 1.0,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
                height: 65,
                width: 65,
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (BuildContext context, child) => child!,
                  child: Transform.rotate(
                    angle: _rotateAnimation.value,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        size: 35,
                        color: Colors.green,
                      ),
                      onPressed: () async {
                        if (!selected) {
                          controller.reset();
                          controller.forward();
                        }
                        if (selected) controller.reverse();
                        selected = !selected;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Expanded bottomIcon(
      {required IconData icon, required String name, required int page}) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        onPressed: () => changeActivePage(page),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent.withOpacity(0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            Text(name, style: const TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
