import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

import '../base_app_bar.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  static final Widget _eventIcon = Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: const Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );
  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final DateTime _currentDate = DateTime(2019, 2, 5);
  // final DateTime _currentDate2 = DateTime(2019, 2, 5);
  // String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  DateTime _targetDateTime = DateTime(2019, 2, 5);

  static final Widget _eventIcon = Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: const Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2019, 2, 10): [
        Event(
          date: DateTime(2019, 2, 10),
          title: 'Event 1',
          icon: Page3._eventIcon,
          dot: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        Event(
          date: DateTime(2019, 2, 10),
          title: 'Event 2',
          icon: Page3._eventIcon,
        ),
        Event(
          date: DateTime(2019, 2, 10),
          title: 'Event 3',
          icon: Page3._eventIcon,
        ),
      ],
    },
  );

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    _markedDateMap.add(
        DateTime(2019, 2, 25),
        Event(
          date: DateTime(2019, 2, 25),
          title: 'Event 5',
          icon: _eventIcon,
        ));

    _markedDateMap.add(
        DateTime(2019, 2, 10),
        Event(
          date: DateTime(2019, 2, 10),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(DateTime(2019, 2, 11), [
      Event(
        date: DateTime(2019, 2, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      Event(
        date: DateTime(2019, 2, 11),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      Event(
        date: DateTime(2019, 2, 11),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//     final _calendarCarousel = CalendarCarousel<Event>(
//       onDayPressed: (date, events) {
//         setState(() => _currentDate = date);
//         for (var event in events) {
//           print(event.title);
//         }
//       },
//       weekendTextStyle: const TextStyle(
//         color: Colors.red,
//       ),
//       thisMonthDayBorderColor: Colors.grey,
// //          weekDays: null, /// for pass null when you do not want to render weekDays
//       headerText: 'Custom Header',
//       weekFormat: true,
//       markedDatesMap: _markedDateMap,
//       height: 200.0,
//       selectedDateTime: _currentDate2,
//       showIconBehindDayText: true,
// //          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
//       customGridViewPhysics: const NeverScrollableScrollPhysics(),
//       markedDateShowIcon: true,
//       markedDateIconMaxShown: 2,
//       selectedDayTextStyle: const TextStyle(
//         color: Colors.yellow,
//       ),
//       todayTextStyle: const TextStyle(
//         color: Colors.blue,
//       ),
//       markedDateIconBuilder: (event) {
//         return event.icon ?? const Icon(Icons.help_outline);
//       },
//       minSelectedDate: _currentDate.subtract(const Duration(days: 360)),
//       maxSelectedDate: _currentDate.add(const Duration(days: 360)),
//       todayButtonColor: Colors.transparent,
//       todayBorderColor: Colors.green,
//       markedDateMoreShowTotal:
//           true, // null for not showing hidden events indicator
// //          markedDateIconMargin: 9,
// //          markedDateIconOffset: 3,
//     );

    /// Example Calendar Carousel without header and custom prev & next button
    final calendarCarouselNoHeader = CalendarCarousel<Event>(
      // selectedDateTime: _currentDate2,
      // selectedDayButtonColor: Colors.grey,
      // selectedDayBorderColor: Colors.red,
      // selectedDayTextStyle: const TextStyle(
      //   color: Colors.black,
      // ),
      todayBorderColor: Colors.grey,
      todayTextStyle: const TextStyle(color: Colors.black),
      weekdayTextStyle: TextStyle(color: Colors.grey.shade600),
      // onDayPressed: (date, events) {
      //   setState(() => _currentDate2 = date);
      //   for (var event in events) {
      //     print(event.title);
      //   }
      // },
      // daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: const TextStyle(color: Colors.black),
      // thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      // firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 280.0,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          const CircleBorder(side: BorderSide(color: Colors.green, width: 8)),
      markedDateCustomTextStyle:
          const TextStyle(fontSize: 14, color: Colors.black),
      showHeader: false,
      markedDateShowIcon: true,
      // markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      // markedDateMoreShowTotal: true,
      locale: 'JAP',
      minSelectedDate: _currentDate.subtract(const Duration(days: 360)),
      maxSelectedDate: _currentDate.add(const Duration(days: 360)),
      prevDaysTextStyle: TextStyle(fontSize: 13, color: Colors.grey.shade400),
      nextDaysTextStyle: TextStyle(fontSize: 13, color: Colors.grey.shade400),
      // inactiveDaysTextStyle: const TextStyle(
      //   color: Colors.black,
      //   fontSize: 14,
      // ),
      onCalendarChanged: (DateTime date) {
        setState(() {
          _targetDateTime = date;
          // String _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {},
    );

    // double width = 25;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                width: 230,
                height: 40,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    elevation: 0,
                    primary: Colors.grey,
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.mood,
                        color: Colors.green.shade500,
                        size: 25,
                      ),
                      Container(width: 7),
                      const Text(
                        '毎日の気分',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      Container(width: 4),
                      const Text(
                        '(3x)',
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.green.shade500,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //custom icon

            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: _calendarCarousel,
            // ), // This trailing comma makes auto-formatting nicer for build methods.

            //custom icon without header

            // Container(
            //   margin: const EdgeInsets.only(
            //     top: 30.0,
            //     bottom: 16.0,
            //     left: 16.0,
            //     right: 16.0,
            //   ),
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //           child: Text(
            //         _currentMonth,
            //         style: const TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 24.0,
            //         ),
            //       )),
            //       TextButton(
            //         child: const Text('PREV'),
            //         onPressed: () {
            //           setState(() {
            //             _targetDateTime = DateTime(
            //                 _targetDateTime.year, _targetDateTime.month - 1);
            //             _currentMonth =
            //                 DateFormat.yMMM().format(_targetDateTime);
            //           });
            //         },
            //       ),
            //       TextButton(
            //         child: const Text('NEXT'),
            //         onPressed: () {
            //           setState(() {
            //             _targetDateTime = DateTime(
            //                 _targetDateTime.year, _targetDateTime.month + 1);
            //             _currentMonth =
            //                 DateFormat.yMMM().format(_targetDateTime);
            //           });
            //         },
            //       )
            //     ],
            //   ),
            // ),

            Container(
              margin: const EdgeInsets.all(16.0),
              child: calendarCarouselNoHeader,
            ), //
            const Divider(indent: 16, endIndent: 16, color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '3',
                      style: TextStyle(
                          color: Colors.greenAccent.shade700, fontSize: 20),
                    ),
                    Container(height: 10),
                    Container(
                      width: 50,
                      height: 10,
                      color: Colors.greenAccent.shade700,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '3',
                      style: TextStyle(
                          color: Colors.lightGreen.shade400, fontSize: 20),
                    ),
                    Container(height: 10),
                    Container(
                      width: 50,
                      height: 10,
                      color: Colors.lightGreen.shade400,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '3',
                      style: TextStyle(
                          color: Colors.lightBlue.shade300, fontSize: 20),
                    ),
                    Container(height: 10),
                    Container(
                      width: 50,
                      height: 10,
                      color: Colors.lightBlue.shade300,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '3',
                      style: TextStyle(
                          color: Colors.orangeAccent.shade400, fontSize: 20),
                    ),
                    Container(height: 10),
                    Container(
                      width: 50,
                      height: 10,
                      color: Colors.orangeAccent.shade400,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '3',
                      style: TextStyle(
                          color: Colors.redAccent.shade400, fontSize: 20),
                    ),
                    Container(height: 10),
                    Container(
                      width: 50,
                      height: 10,
                      color: Colors.redAccent.shade400,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
