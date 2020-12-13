import 'package:clickable_regions/clickable_car_widget/model/path_model.dart';
import'package:flutter/material.dart';




  ///Model to describe the car
class CarModel {

  PathModel pathModel;
  Color color;
  bool isClickable = true;

  CarModel(this.pathModel , this.color , this.isClickable);

}
