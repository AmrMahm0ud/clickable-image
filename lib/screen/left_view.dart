import 'package:clickable_regions/clickable_car_widget/car_widget/car_widget.dart';
import 'package:flutter/material.dart';


class CarScreen extends StatefulWidget {
  @override
  _CarScreenState createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  final String APP_NAME = "Car App";
  final svgPath = "assets/images/leftview.svg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_NAME),
      ),
      body: CarWidget(
        svgPath: svgPath,
        scale: 0.75,
        onYes: (carModel) {
          printMethod(carModel.pathModel.path);
        },
        onNo: (carModel) {
          print("NO");
        },
        onCancel: (carModel) {
          print("Cancel");
        },
      ),
    );
  }
  /////////////////////////////////////////////////
  ////////////Helper Method///////////////////////
  ///////////////////////////////////////////////

  void printMethod(Path carSvgPath) {
    print(carSvgPath);
  }
}
