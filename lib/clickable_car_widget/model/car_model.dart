import'package:flutter/material.dart';

import 'package:clickable_regions/model/path_model.dart';



  ///Model to describe the car
class CarModel {

  PathModel pathModel;
  Color color;
  bool isClickable = true;

  CarModel(this.pathModel , this.color , this.isClickable);

}
