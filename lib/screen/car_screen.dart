import 'package:flutter/material.dart';


import 'package:clickable_regions/model/car_model.dart';
import 'package:clickable_regions/widget/side_car_data/car_four_svg_data.dart';
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
    buildSvgImageList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_NAME),
      ),
      body: CarWidget(carModelList: buildSvgImage, width: 300.0, height: 150.0, onClick: (carModel){
        printMethod(carModel.carSvgParts);
      },
      ),
    );
  }
  /////////////////////////////////////////////////
  ////////////Helper Method///////////////////////
  ///////////////////////////////////////////////

  void buildSvgImageList(){
    List <String> clickAbleList = ['CarParts.EKSEDAMLF','CarParts.RFRFLB','CarParts.DOORLB','CarParts.DOORLF','CarParts.LIGHTSPOTLB','CarParts.WHEELLF','CarParts.STROKEGLASSLF','CarParts.GLASSLB','CarParts.SHORAALB','CarParts.RFRFLF','CarParts.ATBL','CarParts.EKSDAMLB','CarParts.LIGHTSPOTLF'];
    for(int i = 0 ; i < CarParts.values.length ; i ++ ){
      buildSvgImage.add(CarModel(getPathByProvince(CarParts.values[i]) , Colors.white , CarParts.values[i].toString(), clickAbleList.contains(CarParts.values[i].toString()) )) ;
    }
  }

  void printMethod(Path carSvgPath){
    print(carSvgPath);
  }
}
