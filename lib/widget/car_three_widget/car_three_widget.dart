import 'package:clickable_regions/model/model_for_car_three.dart';
import 'package:flutter/material.dart';

import 'map_svg_data_for_car_three.dart';





class CarThreePage extends StatefulWidget {
  CarThreePage({Key key}) : super(key: key);

  // final String title;

  @override
  _CarThreePageState createState() => _CarThreePageState();
}

class _CarThreePageState extends State<CarThreePage> {
  carThree _pressedProvince;

  List<CarThree> paintPart = []; // change
  List<CarThree> buildMap = [] ;
  CarThree _carThree ;


  @override
  Widget build(BuildContext context) {
    /// Calculate the center point of the SVG map,
    /// use parent widget for width/heigth.
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double navBarHeight =
    Theme.of(context).platform == TargetPlatform.android ? 56.0 : 44.0;
    double safeZoneHeight = MediaQuery.of(context).padding.bottom;

    double scaleFactor = 0.5;

    double x = (width / 2.0) - (MapSvgData.width / 2.0);
    double y = (height / 2.0) -
        (MapSvgData.height / 2.0) -
        (safeZoneHeight / 2.0) -
        navBarHeight;
    Offset offset = Offset(x, y);

    return Scaffold(
        appBar: AppBar(title: Text('Map Image')),
        body: SafeArea(
            child: Transform.scale(
                scale: ((height / MapSvgData.height)) * scaleFactor,
                child: Transform.translate(
                    offset: offset, child: Stack(children: _buildMap()
                )
                )
            )
        )
    );
  }

  //using for build map
  List<Widget> _buildMap() {
    var list = _buildList();
    List<Widget> provinces = List(list.length);
    for (int i = 0; i < list.length; i++) {
      provinces[i] = _buildProvince(list[i]);
      // print(list[i].pro);
    }
    return provinces;
  }


  //for buildmap using class mobdel
  List <CarThree> _buildList(){
    for (int i = 0 ; i < carThree.values.length ; i ++ ){
      buildMap.add(CarThree(carThree.values[i] , Colors.transparent));
    }
    return buildMap;
  }




  Widget _buildProvince(CarThree carThreeParts) {
    return ClipPath(
        child: Stack(children: <Widget>[
          CustomPaint(
              painter: PathPainter(carThreeParts)),
          Material(
              color: Colors.white,
              child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Do You want to paint it "),
                          actions: [
                            FlatButton(
                              child: Text("yes"),

                              onPressed: () {

                                _carThree = CarThree(carThreeParts.car , Colors.red);

                                setState(() {
                                  paintPart.add(_carThree);
                                });
                                // change
                                _provincePressed(carThreeParts);

                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text("NO"),
                              onPressed: () {
                                debugPrint(carThreeParts.toString());

                                setState(() {

                                  checkForDeletePart(carThreeParts); // for test

                                });
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        )
                    );
                  },
                  child: Container(
                      color: checkForSelectPart(carThreeParts) //for test
                          ? Colors.red
                          : Colors.transparent
                  )
              )
          )
        ]
        ),
        clipper: PathClipper(carThreeParts));
  }

  bool checkForSelectPart(CarThree carThreePart){
    for (int i = 0 ; i < paintPart.length ; i ++){
      if(paintPart[i].car == carThreePart.car){
        return true;
      }
    }
    return false ;
  }

  bool checkForDeletePart(CarThree carThreePart){
    for (int i = 0 ; i < paintPart.length ; i ++){
      if(paintPart[i].car == carThreePart.car){
        paintPart.remove(paintPart[i]);
        return true;
      }
    }
    return false ;
  }

  void _provincePressed(CarThree carThreePart) {
    setState(() {
      _pressedProvince = carThreePart.car;
    });
  }
}


class PathPainter extends CustomPainter {
  final CarThree carThreePart;
  PathPainter(this.carThreePart);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = getPathByProvince(carThreePart.car);
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
  final CarThree carThreePart;
  PathClipper(this.carThreePart);

  @override
  Path getClip(Size size) {
    return getPathByProvince(carThreePart.car);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
