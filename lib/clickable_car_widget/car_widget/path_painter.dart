import 'package:flutter/material.dart';




/// this class to draw each path
class PathPainter extends CustomPainter {
  ///use path to draw the shap
  ///use strokePathwidth to determine the path width and change it
  final Path _carPartPath;
  final double strokPathWidth;
  PathPainter(this._carPartPath , this.strokPathWidth);
  ///Canvas used to draw the path
  @override
  void paint(Canvas canvas , Size size) {
    Path path = _carPartPath;
    ///here this method to draw th path this style you can change it to fill to fill all the path
    ///and the color of the path
    ///and the width of path
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
