import 'package:clickable_regions/model/car_model.dart';
import 'package:clickable_regions/widget/car_widget/path_clipper.dart';
import 'package:clickable_regions/widget/car_widget/path_painter.dart';
import 'package:flutter/material.dart';


class CarWidget extends StatefulWidget {
   final List<CarModel> carModelList;
   final width ;
   final height ;
   Color baseColor;
   Color partPaintingColor;
   bool isLandScape;
   final Function(CarModel car) onClick ;
   CarWidget({
   @required this.carModelList,
   @required this.width,
   @required this.height,
   this.baseColor=Colors.white,
   this.partPaintingColor=Colors.red,
   this.isLandScape = true,
   this.onClick
  });

  @override
  _CarWidgetState createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  final String BUTTON_CANCEL = "Cancel";
  final String BUTTON_YES = "Yes" ;
  final String BUTTON_NO = "No";
  final String TEXT_ASK_TO_PAINT = "Do You Want To Paint It";


  CarModel _pressedProvince;
  @override
  Widget build(BuildContext context) {

    return  Center(
      child: RotatedBox(
        quarterTurns: checkForLandScap(widget.isLandScape),
            child: Container(
                width:  widget.width,
                height: widget.height,
                child: Stack(children: _buildSvgImage()
                )
        ),
      ),
    );
  }

  //using for build map
  List<Widget> _buildSvgImage() {
    var list = widget.carModelList;
    List<Widget> carFourPaths = List(list.length);
    for (int i = 0; i < list.length; i++) {
      carFourPaths[i] = _buildCarParts(list[i]);
    }
    return carFourPaths;
  }

  Widget _buildCarParts(CarModel car) {
    return ClipPath(
        child: Stack(
        children: <Widget>[
          Material(
              color: widget.baseColor,
              child: InkWell(
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(TEXT_ASK_TO_PAINT),
                      actions: [
                        FlatButton(
                          child: Text(BUTTON_YES),
                          onPressed: () {
                            for (int i = 0; i < widget.carModelList.length; i++) {
                              if (widget.carModelList[i].carSvgParts == car.carSvgParts) {
                                setState(() {
                                  widget.carModelList[i].color = widget.partPaintingColor;
                                });
                              }
                            }
                            _carPartPressed(car);
                            widget.onClick(car);
                            navPop();
                          },
                        ),
                        FlatButton(
                          child: Text(BUTTON_NO),
                          onPressed: () {
                            for (int i = 0; i < widget.carModelList.length; i++) {
                              if (widget.carModelList[i].carSvgParts == car.carSvgParts) {
                                setState(() {
                                  widget.carModelList[i].color = widget.baseColor;
                                });
                              }
                            }
                            navPop();
                          },
                        ),
                        FlatButton(
                          child: Text(BUTTON_CANCEL),
                          onPressed: () {
                          navPop();
                          },
                        ),
                      ],
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    color: car.color == widget.partPaintingColor //for test
                        ? widget.partPaintingColor
                        : widget.baseColor,
                  )
              )
          ),
          CustomPaint(painter: PathPainter(car)),
        ]
        ),
        clipper: PathClipper(car));
  }





  ////////////////////////////////////////////////////////////////////
  //////////////////////Helper Method ////////////////////////////////
  ////////////////////////////////////////////////////////////////////


  void _carPartPressed(CarModel province) {
    setState(() {
      _pressedProvince = CarModel(province.carSvgParts, province.color , province.name);
    });
  }

  void navPop(){
    Navigator.pop(context);
  }
}


 int checkForLandScap(bool isLandScap){
  if (isLandScap){
    return 1;
  }else return 0;
 }