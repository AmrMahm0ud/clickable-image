import 'package:flutter/material.dart';

/// this class is response for clip the Container
class PathClipper extends CustomClipper<Path> {
  ///this path draw the shap of the container
  final Path _carPartPath;
  PathClipper(this._carPartPath);

  ///Returns the outer path of shape as the clip.
  @override
  Path getClip(Size size) {
    return _carPartPath;
  }

  ///https://api.flutter.dev/flutter/rendering/CustomClipper/shouldReclip.html
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
