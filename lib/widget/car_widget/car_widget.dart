import'package:flutter/material.dart';


import'package:clickable_regions/model/car_model.dart';
import 'package:clickable_regions/widget/car_widget/path_clipper.dart';
import 'package:clickable_regions/widget/car_widget/path_painter.dart';



class CarWidget extends StatefulWidget {
   final List<CarModel> carModelList;
   final width ;
   final height ;
   final Color unSelectedPart;
   final Color selectedPart;
   final bool isLandScape;
   final double strokePathWidth;
   final Function(CarModel car) onYes ;
   final Function(CarModel car) onNo ;
   final Function(CarModel car) onCancel ;



   CarWidget({
   @required this.carModelList,
   @required this.width,
   @required this.height,
   @required this.onYes,
   @required this.onNo,
   @required this.onCancel,
   this.unSelectedPart=Colors.white,
   this.selectedPart=Colors.red,
   this.isLandScape = true,
   this.strokePathWidth = 1.0,
   });

  @override
  _CarWidgetState createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  final String BUTTON_CANCEL = "Cancel";
  final String BUTTON_YES = "Yes" ;
  final String BUTTON_NO = "No";
  final String TEXT_ASK_TO_PAINT = "Do You Want To Paint It";

  @override
  Widget build(BuildContext context) {
      return InteractiveViewer(
        minScale: 0.5,
        maxScale: 4,
        child: Center(
          child: RotatedBox(
            quarterTurns: widget.isLandScape ? 1 : 0 ,
                child: Container(
                    width:  widget.width,
                    height: widget.height,
                    child: Stack(children: _buildSvgImage()
                    ),
            ),
          ),
        ),
      );
  }



  ////////////////////////////////////////////////////////////////////
  //////////////////////////Widget////////////////////////////////////
  ////////////////////////////////////////////////////////////////////




  Widget _buildCarParts(CarModel car) {
    return ClipPath(
        child: Stack(
            children: <Widget>[
              Material(
                  color: widget.unSelectedPart,
                  child: car.isClickable ? InkWell(
                      onTap: () => _showDialogBox(car),
                      child: Container(
                        color: car.color == widget.selectedPart
                            ? widget.selectedPart
                            : widget.unSelectedPart,
                      )
                  ):
                  Container(
                    color: widget.unSelectedPart,
                  )
              ),
              CustomPaint(painter: PathPainter(car.carSvgParts , widget.strokePathWidth)),
            ]
        ),
        clipper: PathClipper(car.carSvgParts));
  }

  //using for build car SVG Image
  List<Widget> _buildSvgImage() {
    var list = widget.carModelList;
    List<Widget> carPaths = [];
    list.forEach((element) {
      carPaths.add(_buildCarParts(element));
    });
    return carPaths;
  }

  Widget yesFlatButton(CarModel car){
   return FlatButton(
      child: Text(BUTTON_YES),
      onPressed: () {
        int currentIndex = widget.carModelList.indexOf(car);
        paintPart(car.carSvgParts , currentIndex);
        widget.onYes(car);
        navPop();
      },
    );
  }

  Widget noFlatButton(CarModel car){
    return FlatButton(
      child: Text(BUTTON_NO),
      onPressed: () {
        int currentIndex = widget.carModelList.indexOf(car);
        unPaintPart(car.carSvgParts  , currentIndex);
        widget.onNo(car);
        navPop();
      },
    );
  }


  Widget cancelFlatButton(CarModel car){
    return FlatButton(
      child: Text(BUTTON_CANCEL),
      onPressed: () {
        widget.onCancel(car);
        navPop();
      },
    );
  }



  ////////////////////////////////////////////////////////////////////
  ////////////////////// Helper Method ////////////////////////////////
  ////////////////////////////////////////////////////////////////////


  void paintPart(Path carPath ,int currentIndex){
      setState(() {
        widget.carModelList[currentIndex].color = widget.selectedPart;
      });
  }

  void unPaintPart(Path carPath , int currentIndex){
      setState(() {
        widget.carModelList[currentIndex].color = widget.unSelectedPart;
      });
  }

  void navPop(){
    Navigator.pop(context);
  }

  _showDialogBox(CarModel car){
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(TEXT_ASK_TO_PAINT),
        actions: [
          yesFlatButton(car),
          noFlatButton(car),
          cancelFlatButton(car),
        ],
      ),
    );
  }

}


