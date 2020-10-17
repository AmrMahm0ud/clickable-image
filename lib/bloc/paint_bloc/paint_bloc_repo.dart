
import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_state.dart';
import 'package:clickable_regions/model/car_model.dart';
import 'package:clickable_regions/widget/side_car_data/car_four_svg_data.dart';
import 'package:flutter/material.dart';

abstract class PaintBlocRepo{

PaintState buildSvgImageList();
PaintState paintPart(int index , List<CarModel> imageList);
PaintState unPaintPart(int index , List<CarModel> imageList);
}


class PaintRepostrey implements PaintBlocRepo {

   ///method to build to build image list
    @override
    PaintState buildSvgImageList() {
    PaintState paintState ;
    List<CarModel> listSvgImage = [] ;
    List <String> clickAbleList = ['CarParts.EKSEDAMLF','CarParts.RFRFLB','CarParts.DOORLB','CarParts.DOORLF','CarParts.LIGHTSPOTLB','CarParts.WHEELLF','CarParts.GLASSLB','CarParts.SHORAALB','CarParts.RFRFLF','CarParts.ATBL','CarParts.EKSDAMLB','CarParts.LIGHTSPOTLF'];
    for(int i = 0 ; i < CarParts.values.length ; i ++ ){
      listSvgImage.add(CarModel(getPathByProvince(CarParts.values[i]) , Colors.white , CarParts.values[i].toString(), clickAbleList.contains(CarParts.values[i].toString()) )) ;
    }
    paintState = ImageListLoadedState(listSvgImage);
    return paintState;
  }
   ///Paint Part method
  @override
  PaintState paintPart(int index , List<CarModel> imageList) {
      imageList[index].color = Colors.red ;
      return SelectedState(imageList);
    }

    @override
    PaintState unPaintPart(int index , List<CarModel> imageList) {
        imageList[index].color = Colors.white ;
        return UnSelectedState(imageList);
    }


}
