import 'package:clickable_regions/model/model_for_car_four.dart';
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
   this.isLandScape=true,
   this.onClick
  });

  @override
  _CarWidgetState createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
   CarModel _pressedProvince;
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double navBarHeight =
    Theme.of(context).platform == TargetPlatform.android ? 56.0 : 44.0;
    double safeZoneHeight = MediaQuery.of(context).padding.bottom;
    double scaleFactor = 0.5;
    double x = (width / 2.0) - (widget.width / 2.0);
    double y = (height / 2.0) - (widget.height / 2.0) - (safeZoneHeight / 2.0) - navBarHeight;
    Offset offset = Offset(x, y);
    return  SafeArea(
            child: Transform.scale(
                scale: ((height / 250)) * scaleFactor,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Transform.translate(
                    offset: offset,
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Stack(children: _buildSvgImage())),
                  ),
                )
            )
        );
  }

  //using for build map
  List<Widget> _buildSvgImage() {
    var list = widget.carModelList;
    List<Widget> carFourPaths = List(list.length);
    for (int i = 0; i < list.length; i++) {
      carFourPaths[i] = _buildCar(list[i]);
    }
    return carFourPaths;
  }

  Widget _buildCar(CarModel car) {
    return ClipPath(
        child: Stack(
        children: <Widget>[
          Material(
              color: widget.baseColor,
              child: InkWell(
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Do You want to paint it "),
                      actions: [
                        FlatButton(
                          child: Text("yes"),
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
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          child: Text("NO"),
                          onPressed: () {
                            for (int i = 0; i < widget.carModelList.length; i++) {
                              if (widget.carModelList[i].carSvgParts == car.carSvgParts) {
                                setState(() {
                                  widget.carModelList[i].color = widget.baseColor;
                                });
                              }
                            }
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.pop(context);
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


  void _carPartPressed(CarModel province) {
    setState(() {
      _pressedProvince = CarModel(province.carSvgParts, province.color , province.name);
    });
  }
}

class PathPainter extends CustomPainter {
  final CarModel _carPart;
  PathPainter(this._carPart);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = _carPart.carSvgParts;
    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.black
          ..strokeWidth = 2.0);
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(PathPainter oldDelegate) => false;
}

class PathClipper extends CustomClipper<Path> {
  final CarModel _carPart;
  PathClipper(this._carPart);

  @override
  Path getClip(Size size) {
    return _carPart.carSvgParts;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
