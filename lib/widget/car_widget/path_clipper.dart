
import 'package:clickable_regions/model/car_model.dart';
import 'package:flutter/material.dart';

class PathClipper extends CustomClipper<Path> {
  final CarModel _carPart;
  PathClipper(this._carPart);

  @override
  Path getClip(Size size) {
    return _carPart.carSvgParts;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
