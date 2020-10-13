import 'package:clickable_regions/model/car_model.dart';
import 'package:clickable_regions/widget/side_car_data/car_four_svg_data.dart';
import 'package:flutter/material.dart';
import '../widget/car_widget/car_widget.dart';


class CarScreen extends StatefulWidget {
  @override
  _CarScreenState createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  final String APP_NAME = "Car App" ;
  CarModel carModel ;
  List<CarModel> buildSvgImage = [];

  @override
  void initState() {
    super.initState();
    for(int i = 0 ; i < CarParts.values.length ; i ++ ){
      buildSvgImage.add(CarModel(getPathByProvince(CarParts.values[i]) , Colors.white , CarParts.values[i].toString())) ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_NAME),
      ),
      body: CarWidget(carModelList: buildSvgImage, width: 300.0, height: 150.0, onClick: (carModel){
        print(carModel.carSvgParts);
        print("Amr");
      },),
    );
  }
}
