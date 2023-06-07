// ignore_for_file: file_names
import 'package:daylio_imitation/pages/sub/search.dart';
import 'package:flutter/material.dart';

import '../pages/sub/how_do_u_feel.dart';

class IconSlide extends StatelessWidget {
  const IconSlide({
    Key? key,
    required Animation<Offset> offsetAnimation1,
    required this.height,
    required this.width,
    required this.color,
    required this.icon,
    required this.size,
    required this.id,
  })  : _offsetAnimation1 = offsetAnimation1,
        super(key: key);

  final Animation<Offset> _offsetAnimation1;
  final double height;
  final double width;
  final Color color;
  final IconData icon;
  final double size;
  final int id;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation1,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black, //New
              blurRadius: 1.0,
              offset: Offset(0, 1.5),
            ),
          ],
        ),
        height: height,
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => id == 2
                    ? const HowDoYouFeel(uid: 'a')
                    : const Search(), //'a' is dummy word
                fullscreenDialog: true,
              ),
            );
          },
          child: Icon(
            icon,
            size: size,
          ),
        ),
      ),
    );
  }
}

class TextAnimation extends StatelessWidget {
  const TextAnimation({
    Key? key,
    required this.animeTime,
    required this.selected,
    required this.marginL,
    required this.marginT,
    required this.name,
  }) : super(key: key);

  final int animeTime;
  final bool selected;
  final double marginL;
  final double marginT;
  final String name;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: animeTime),
      opacity: selected ? 1.0 : 0.0,
      child: Container(
        margin: EdgeInsets.fromLTRB(marginL, marginT, 0, 0),
        child: Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
