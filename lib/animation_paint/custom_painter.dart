import 'package:flutter/material.dart';

class Painter extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Painter(
      {required this.index, required this.selected, required this.size});
  final int index;
  final bool selected;
  final double size;

  @override
  Widget build(BuildContext context) {
    var green = Colors.green;
    var lgreen = Colors.lightGreen;
    var blue = Colors.blue;
    var orange = Colors.orange;
    var red = Colors.red;
    var transparent = Colors.transparent;
    List<Color> color = [green, lgreen, blue, orange, red];
    List painter = [
      AwesomePainter(selected: selected, facesize: size),
      GoodPainter(selected: selected, facesize: size),
      NormalPainter(selected: selected, facesize: size),
      BadPainter(selected: selected, facesize: size),
      DepressedPainter(selected: selected, facesize: size)
    ];
    int i = index;

    return Container(
      alignment: Alignment.topLeft,
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: selected ? transparent : color[i],
        shape: BoxShape.circle,
      ),
      child: CustomPaint(painter: painter[i]),
    );
  }
}

class AwesomePainter extends CustomPainter {
  AwesomePainter({required this.selected, required this.facesize});
  final bool selected;
  final double facesize;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = selected ? Colors.green : Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double iconSize = facesize;

    double a = iconSize * .8,
        b = iconSize * .6,
        c = iconSize * .5,
        d = iconSize * .2;
    double e = iconSize * .2,
        f = iconSize * .3, // height
        g = iconSize * .4,
        h = iconSize * .4, //
        i = iconSize * .5, //
        j = iconSize * .6,
        k = iconSize * .8;
    double l = facesize * .5;

    final path = Path()
      ..moveTo(a, b)
      ..conicTo(c, iconSize * 1.4, d, b, 0.5)
      ..conicTo(c, iconSize, a, b, 0.5)
      ..lineTo(d, b)
      ..close();

    canvas.drawLine(Offset(e, f), Offset(g, h), paint);
    canvas.drawLine(Offset(e, i), Offset(g, h), paint);
    canvas.drawLine(Offset(j, h), Offset(k, f), paint);
    canvas.drawLine(Offset(j, h), Offset(k, i), paint);
    canvas.drawPath(path, paint);
    canvas.drawCircle(Offset(l, l), l, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GoodPainter extends CustomPainter {
  GoodPainter({required this.selected, required this.facesize});
  final bool selected;
  final double facesize;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = selected ? Colors.lightGreen : Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final dispaint = Paint()
      ..color = selected ? Colors.white : Colors.lightGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double iconSize = facesize;
    double a = iconSize * .8, b = iconSize * .65, c = iconSize * .2; //mouth
    double d = iconSize * .25, e = iconSize * .5, f = iconSize * .75; //eyes
    double circle = iconSize * .07;
    double g = facesize * .5;

    final path = Path()
      ..moveTo(a, b)
      ..conicTo(iconSize * .5, iconSize * 1.4, c, b, 0.4)
      ..close();

    canvas.drawCircle(Offset(d, e), circle, paint);
    canvas.drawCircle(Offset(f, e), circle, paint);
    canvas.drawPath(path, paint);
    canvas.drawLine(Offset(c * .9, b), Offset(a * 1.1, b), dispaint);
    canvas.drawCircle(Offset(g, g), g, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class NormalPainter extends CustomPainter {
  NormalPainter({required this.selected, required this.facesize});
  final bool selected;
  final double facesize;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = selected ? Colors.blue : Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final dispaint = Paint()
      ..color = selected ? Colors.white : Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    double iconSize = facesize;

    var a = iconSize * .65;
    var b = iconSize * .8;
    var c = iconSize * .5;
    var eyes = iconSize * .06;

    final path = Path()
      ..moveTo(a, b)
      ..conicTo(c, c, iconSize * .27, iconSize * .67, 0.5)
      ..close();

    canvas.drawCircle(Offset(iconSize * .3, iconSize * .43), eyes, paint);
    canvas.drawCircle(Offset(iconSize * .7, iconSize * .48), eyes, paint);
    canvas.drawLine(Offset(iconSize * .15, iconSize * .3),
        Offset(iconSize * .4, iconSize * .25), paint);
    canvas.drawLine(Offset(iconSize * .6, iconSize * .3),
        Offset(iconSize * .85, iconSize * .33), paint);

    canvas.drawPath(path, paint);
    canvas.drawLine(Offset(iconSize * .2, a), Offset(b, b * 1.05), dispaint);
    canvas.drawCircle(
        Offset(facesize * .5, facesize * .5), facesize * .5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BadPainter extends CustomPainter {
  BadPainter({required this.selected, required this.facesize});
  final bool selected;
  final double facesize;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = selected ? Colors.orange : Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final dispaint = Paint()
      ..color = selected ? Colors.white : Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double iconSize = facesize;
    var eyes = iconSize * .06;

    final path = Path()
      ..moveTo(iconSize * .7, iconSize * .85)
      ..conicTo(
          iconSize * .5, iconSize * .5, iconSize * .3, iconSize * .85, 0.5)
      ..close();

    canvas.drawCircle(Offset(iconSize * .3, iconSize * .5), eyes, paint);
    canvas.drawCircle(Offset(iconSize * .7, iconSize * .5), eyes, paint);
    canvas.drawLine(Offset(iconSize * .6, iconSize * .3),
        Offset(iconSize * .9, iconSize * .35), paint);
    canvas.drawLine(Offset(iconSize * .4, iconSize * .3),
        Offset(iconSize * .1, iconSize * .35), paint);

    canvas.drawPath(path, paint);

    canvas.drawLine(Offset(iconSize * .25, iconSize * .85),
        Offset(iconSize * .75, iconSize * .85), dispaint);
    canvas.drawCircle(
        Offset(facesize * .5, facesize * .5), facesize * .5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DepressedPainter extends CustomPainter {
  DepressedPainter({required this.selected, required this.facesize});
  final bool selected;
  final double facesize;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = selected ? Colors.red : Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double iconSize = facesize;

    // left eye
    canvas.drawLine(Offset(iconSize * .2, iconSize * .45),
        Offset(iconSize * .37, iconSize * .55), paint);
    canvas.drawLine(Offset(iconSize * .2, iconSize * .65),
        Offset(iconSize * .37, iconSize * .55), paint);
    // right eye
    canvas.drawLine(Offset(iconSize * .63, iconSize * .55),
        Offset(iconSize * .8, iconSize * .45), paint);
    canvas.drawLine(Offset(iconSize * .63, iconSize * .55),
        Offset(iconSize * .8, iconSize * .65), paint);
    // mouth
    canvas.drawLine(Offset(iconSize * .25, iconSize * .75),
        Offset(iconSize * .3, iconSize * .8), paint);
    canvas.drawLine(Offset(iconSize * .3, iconSize * .8),
        Offset(iconSize * .42, iconSize * .72), paint);
    canvas.drawLine(Offset(iconSize * .42, iconSize * .72),
        Offset(iconSize * .5, iconSize * .8), paint);
    canvas.drawLine(Offset(iconSize * .5, iconSize * .8),
        Offset(iconSize * .58, iconSize * .72), paint);
    canvas.drawLine(Offset(iconSize * .58, iconSize * .72),
        Offset(iconSize * .7, iconSize * .8), paint);
    canvas.drawLine(Offset(iconSize * .7, iconSize * .8),
        Offset(iconSize * .77, iconSize * .75), paint);
    canvas.drawCircle(
        Offset(facesize * .5, facesize * .5), facesize * .5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
