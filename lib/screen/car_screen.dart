import 'package:flutter/material.dart';

import '../widget/car_widget/car_widget.dart';


class CarScreen extends StatefulWidget {
  @override
  _CarScreenState createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  final String APP_NAME = "Car App" ;
  final svgPath = "assets/images/hatchback.svg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_NAME),
      ),
      body: CarWidget(svgPath: svgPath, width: 300.0, height: 150.0, onYes: (carModel){
            printMethod(carModel.carSvgParts);
          },
            onNo: (carModel){
            print("NO");
            },
            onCancel: (carModel){
            print("Cancel");
            },

          ),
    );
  }
  /////////////////////////////////////////////////
  ////////////Helper Method///////////////////////
  ///////////////////////////////////////////////


  void printMethod(Path carSvgPath){
    print(carSvgPath);
  }


}



