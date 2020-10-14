import 'package:flutter/material.dart';


class PathClipper extends CustomClipper<Path> {
  final Path _carPartPath;
  PathClipper(this._carPartPath);

  @override
  Path getClip(Size size) {
    return _carPartPath;
  }
  ///https://api.flutter.dev/flutter/rendering/CustomClipper/shouldReclip.html
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
