




import 'package:clickable_regions/model/car_model.dart';
import 'package:flutter/material.dart';

class PathPainter extends CustomPainter {

  final CarModel _carPart;
  PathPainter(this._carPart);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = _carPart.carSvgParts;
    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.black
          ..strokeWidth = 1.0
    );
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(PathPainter oldDelegate) => false;
}
