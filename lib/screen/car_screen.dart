import 'package:clickable_regions/model/model_for_car_four.dart';
import 'package:clickable_regions/widget/car_four_widget/car_four_svg_data.dart';
import 'package:flutter/material.dart';
import '../widget/car_widget/car_widget.dart';


class CarApp extends StatefulWidget {
  @override
  _CarAppState createState() => _CarAppState();
}

class _CarAppState extends State<CarApp> {
  CarModel carModel ;
  List<CarModel> buildSvgImage = [];

  @override
  void initState() {
    super.initState();
    for(int i = 0 ; i < CarFourParts.values.length ; i ++ ){
      buildSvgImage.add(CarModel(getPathByProvince(CarFourParts.values[i]) , Colors.white , CarFourParts.values[i].toString())) ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car App"),
      ),
      body: CarWidget(carModelList: buildSvgImage, width: 550, height: 250, onClick: (carModel){
        print(carModel.carSvgParts);
        print("Amr");
      },),
    );
  }
}
