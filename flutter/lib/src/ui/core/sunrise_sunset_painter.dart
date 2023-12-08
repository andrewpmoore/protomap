import 'package:flutter/material.dart';

class SunriseSunsetPainter extends CustomPainter {


  final Color startColor;
  final Color endColor;

  SunriseSunsetPainter({required this.startColor, required this.endColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Rect rect = Offset.zero & size;
    paint.shader = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        startColor,
        endColor
      ],
    ).createShader(rect);
    paint.isAntiAlias = true;
    paint.style = PaintingStyle.stroke;

    paint.strokeWidth = 3;

    var path = Path();
    path.moveTo(0, size.height*0.5);


    //worked out using http://blogs.sitepointstatic.com/examples/tech/canvas-curves/bezier-curve.html to understand how they work

    path.cubicTo(size.width * 0.30, size.height * 0.5,
                 size.width * 0.70, size.height * 1.0,
                 size.width, size.height * 1);


Curves.easeInOut;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


}