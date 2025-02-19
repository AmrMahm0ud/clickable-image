import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';


import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_bloc.dart';
import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_event.dart';
import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_state.dart';
import 'package:clickable_regions/model/car_model.dart';
import 'package:clickable_regions/widget/car_widget/path_clipper.dart';
import 'package:clickable_regions/widget/car_widget/path_painter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CarWidget extends StatefulWidget {
   final BuildContext pcontext ;
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
   @required this.pcontext,

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
    ///interactiveViewer used to zoom and RotatedBox used to Rotated car Clockwise
      return InteractiveViewer(
        minScale: 0.5,
        maxScale: 4,
        child: Center(
          child: RotatedBox(
            quarterTurns: widget.isLandScape ? 1 : 0 ,
                  child: BlocConsumer<PaintBloc , PaintState>(
                    listener: (context , state) {
                      print(state);
                       if(state is OpenDialogState){
                        _showDialogBox(state.carModel , context);
                       }else if (state is SelectedState){
                         navPop();
                       }else if (state is UnSelectedState) {
                         navPop();
                       }
                    },
                    builder: (context, state){
                    //  print(state);
                      if (state is ImageListLoadedState){
                        return Container(
                          width:  widget.width,
                          height: widget.height,
                          child: Stack(
                              children: _buildSvgImage(state.imageList),
                          ),
                        );
                      }
                      else if (state is SelectedState){
                        return Container(
                          width:  widget.width,
                          height: widget.height,
                          child: Stack(
                              children: _buildSvgImage(state.imageList)
                          ),
                        );
                      }else if (state is UnSelectedState){
                        return Container(
                          width:  widget.width,
                          height: widget.height,
                          child: Stack(
                              children: _buildSvgImage(state.imageList)
                          ),
                        );
                      }
                      else return CircularProgressIndicator();
                    }
                  ),
          ),
        ),
      );
  }



  ////////////////////////////////////////////////////////////////////
  //////////////////////////Widget////////////////////////////////////
  ////////////////////////////////////////////////////////////////////



  ///ClipPath to Clip container to fill inside path and CustomPaint to draw the path
  Widget _buildCarParts(CarModel car) {
    return ClipPath(
        child: Stack(
            children: <Widget>[
              Material(
                  color: widget.unSelectedPart,
                  child: car.isClickable ? InkWell(
                      onTap: () => BlocProvider.of<PaintBloc>(widget.pcontext).add(OpenDialogEvent(car)), //add event
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

  ///used to build car Image List
  List<Widget> _buildSvgImage(List imageList) {
    var list = imageList;
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
        BlocProvider.of<PaintBloc>(widget.pcontext).add(YesButtonPressedEvent(currentIndex, widget.carModelList));
      },
    );
  }

  Widget noFlatButton(CarModel car){
    return FlatButton(
      child: Text(BUTTON_NO),
      onPressed: () {
        int currentIndex = widget.carModelList.indexOf(car);
        BlocProvider.of<PaintBloc>(widget.pcontext).add(NoButtonPressedEvent(currentIndex, widget.carModelList));
        //widget.onNo(car);
        //navPop();
      },
    );
  }


  Widget cancelFlatButton(CarModel car){
    return FlatButton(
      child: Text(BUTTON_CANCEL),
      onPressed: () {
        //widget.onCancel(car);
        navPop();
      },
    );
  }



  ////////////////////////////////////////////////////////////////////
  ////////////////////// Helper Method ////////////////////////////////
  ////////////////////////////////////////////////////////////////////

//
//  void paintPart(Path carPath ,int currentIndex){
//      setState(() {
//        widget.carModelList[currentIndex].color = widget.selectedPart;
//      });
//  }
//
//  void unPaintPart(Path carPath , int currentIndex){
//      setState(() {
//        widget.carModelList[currentIndex].color = widget.unSelectedPart;
//      });
//  }

  void navPop(){
    Navigator.pop(widget.pcontext);
  }

  _showDialogBox(CarModel car , BuildContext context){
    return showDialog(
      context: widget.pcontext,
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


