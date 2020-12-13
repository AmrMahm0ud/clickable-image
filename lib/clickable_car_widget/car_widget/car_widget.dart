import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clickable_regions/car_widget_bloc/car_widget_bloc.dart';
import 'package:clickable_regions/car_widget_bloc/car_widget_event.dart';
import 'package:clickable_regions/car_widget_bloc/car_widget_state.dart';
import 'package:clickable_regions/model/car_model.dart';
import 'package:clickable_regions/widget/car_widget/path_clipper.dart';
import 'package:clickable_regions/widget/car_widget/path_painter.dart';

class CarWidget extends StatefulWidget {
  final Color unSelectedPartColor;
  final Color selectedPartColor;
  final bool isLandScape;
  final double borderPathWidth;
  final Function(CarModel car) onYes;
  final Function(CarModel car) onNo;
  final Function(CarModel car) onCancel;
  final String svgPath;
  final List clickableParts;
  final double scale;

  CarWidget({
    @required this.svgPath,
    @required this.onYes,
    @required this.onNo,
    @required this.onCancel,
    this.clickableParts,
    this.unSelectedPartColor = Colors.white,
    this.selectedPartColor = Colors.red,
    this.isLandScape = true,
    this.borderPathWidth = 1.0,
    this.scale = 1.4,
  });

  @override
  _CarWidgetState createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  final String BUTTON_CANCEL = "Cancel";
  final String BUTTON_YES = "Yes";
  final String BUTTON_NO = "No";
  final String TEXT_ASK_TO_PAINT = "Do You Want To Paint It";
  bool loadingState = false;
  CarModel carModel;
  List<CarModel> svgImageList = [];
  List<Path> paths = [];

  @override
  void initState() {
    super.initState();
    showCarEvent();
  }

  @override
  Widget build(BuildContext context) {
    ///interactiveViewer used to zoom and RotatedBox used to Rotated car Clockwise
    return InteractiveViewer(
      ///InteractiveViewer take min scale and maxScale in other words max zoom out and zoom in
      minScale: 0.5,
      maxScale: 4,
      child: RotatedBox(
        ///quarterTurns take the number of clockwise round you need your widget to take .. in this widget we used 0 or 1 only
        quarterTurns: widget.isLandScape ? 1 : 0,
        child: BlocConsumer<CarWidgetBloc, CarWidgetState>(
          listener: (context, state) {
            if (state is SelectedState) {
              navPop();
            } else if (state is UnSelectedState) {
              navPop();
            } else if (state is CancelState) {
              navPop();
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return loadingWidget();
            } else if (state is ImageListLoadedState) {
              return _buildImageWidget(state.imageList);
            } else if (state is SelectedState) {
              return _buildImageWidget(state.imageList);
            } else if (state is UnSelectedState) {
              return _buildImageWidget(state.imageList);
            } else if (state is CancelState) {
              return _buildImageWidget(state.imageList);
            } else
              return loadingWidget();
          },
        ),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////
  //////////////////////////Widget////////////////////////////////////
  ////////////////////////////////////////////////////////////////////

  ///Build Image Widget
  Widget _buildImageWidget(List imageList) {
    /// is used for Control the Size of the Container
    return Center(
      ///here we put all widget in a stack
      child: Container(
        color: Colors.blue,
          height: 250,
          width: 250,
          child: Transform.scale(
            scale: 0.6,
              child: Stack(children: _buildSvgImage(imageList)))),
    );
  }

  ///ClipPath to Clip container to fill inside path and CustomPaint to draw the path
  Widget _buildCarParts(CarModel car) {
    ///ClipPath to clip the container in the shape of the path
    return ClipPath(
        child: Stack(children: <Widget>[
          Material(
              color: widget.unSelectedPartColor,
              child: InkWell(
                onTap: () => _showDialogBox(car),
                child: Container(
                  color: car.color == widget.selectedPartColor
                      ? widget.selectedPartColor
                      : widget.unSelectedPartColor,
                ),
              )
          ),

          ///custom paint to draw the path
          ///PathPainter take the path and the width
          CustomPaint(
              painter: PathPainter(car.pathModel.path, widget.borderPathWidth)),
        ]),

        /// you must send the path to pathClipper to clip the Container
        clipper: PathClipper(car.pathModel.path));
  }

  ///used to build car Image List
  List<Widget> _buildSvgImage(List imageList) {
    ///i used the list path to build list of widget
    List<Widget> carPaths = [];
    imageList.forEach((element) {
      carPaths.add(_buildCarParts(element));
    });
    return carPaths;
  }

  ///Yes FlatButton to paint the pressed part
  Widget yesFlatButton(CarModel car) {
    return FlatButton(
      child: Text(BUTTON_YES),
      onPressed: () {
        ///here you must git the current index and send it to paint part method
        BlocProvider.of<CarWidgetBloc>(context).add(YesButtonPressedEvent(car));
        widget.onYes(car);
      },
    );
  }

  ///here this method used to undo the paint part
  Widget noFlatButton(CarModel car) {
    return FlatButton(
      child: Text(BUTTON_NO),
      onPressed: () {
        ///here you must git the current index and send it to Unpainted part method
        BlocProvider.of<CarWidgetBloc>(context).add(NoButtonPressedEvent(car));
        widget.onNo(car);
      },
    );
  }

  /// this method only to pop dialog
  Widget cancelFlatButton(CarModel car) {
    return FlatButton(
      child: Text(BUTTON_CANCEL),
      onPressed: () {
        widget.onCancel(car);
        cancelButtonPressedEvent();
      },
    );
  }

  ///Loading Widget
  Widget loadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  ////////////////////////////////////////////////////////////////////
  ////////////////////// Helper Method ////////////////////////////////
  ////////////////////////////////////////////////////////////////////

  void navPop() {
    Navigator.pop(context);
  }

  ///this Method to fire CancelButtonPressedEvent
  cancelButtonPressedEvent() {
    BlocProvider.of<CarWidgetBloc>(context).add(CancelButtonPressedEvent());
  }

  ///this dialog show when part is clicked
  _showDialogBox(CarModel car) {
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

  ///this method to fire ShowCarEvent
  showCarEvent() {
    BlocProvider.of<CarWidgetBloc>(context)
        .add(ShowCarEvent(context, widget.svgPath));
  }
}
