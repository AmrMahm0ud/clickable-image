import 'package:flutter/material.dart';

class PathPainter extends CustomPainter {

  final Path _carPartPath;
  final double strokPathWidth;
  PathPainter(this._carPartPath , this.strokPathWidth);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = _carPartPath;
    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.black
          ..strokeWidth = strokPathWidth
    );
  }

  ///https://api.flutter.dev/flutter/rendering/CustomPainter/shouldRepaint.html
  @override
  bool shouldRepaint(PathPainter oldDelegate) => true;

  ///https://api.flutter.dev/flutter/rendering/CustomPainter/shouldRebuildSemantics.html
  @override
  bool shouldRebuildSemantics(PathPainter oldDelegate) => false;

}
