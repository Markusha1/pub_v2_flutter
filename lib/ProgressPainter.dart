import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  double currentProgress;
  final Color outerColor;
  final Color progressColor;
  final _lineWidth = 5.0;
  ProgressPainter({this.currentProgress, this.outerColor, this.progressColor});
  @override
  void paint(Canvas canvas, Size size) {
    //base circle
    Paint outerCircle = Paint()
      ..strokeWidth = _lineWidth
      ..color = outerColor
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = _lineWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = progressColor;

    Offset center = Offset(size.width/2, size.height/2);
    double radius = min(size.width/2, size.height/2) - 20;

    canvas.drawCircle(center, radius, outerCircle); // draw outer circle

    double angle = 2*pi*(currentProgress/100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi/2, angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}