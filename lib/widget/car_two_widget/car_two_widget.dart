import 'package:flutter/material.dart';

import '../../model/model_for_car_two.dart';

import './map_svg_data_for_car_two.dart';




class CarTwoPage extends StatefulWidget {
  CarTwoPage({Key key}) : super(key: key);

 // final String title;

  @override
  _CarTwoPageState createState() => _CarTwoPageState();
}

class _CarTwoPageState extends State<CarTwoPage> {
  carTwo _pressedProvince;

  List<CarTwo> paintPart = []; // change
  List<CarTwo> buildMap = [] ;
  CarTwo _carTwo ;


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
  List <CarTwo> _buildList(){
    for (int i = 0 ; i < carTwo.values.length ; i ++ ){
      buildMap.add(CarTwo(carTwo.values[i] , Colors.transparent));
    }
    return buildMap;
  }




  Widget _buildProvince(CarTwo carTwoPart) {
    return ClipPath(
        child: Stack(children: <Widget>[
          CustomPaint(
              painter: PathPainter(carTwoPart)),
          Material(
              color: Colors.transparent,
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

                                _carTwo = CarTwo(carTwoPart.car , Colors.red);

                                setState(() {
                                  paintPart.add(_carTwo);
                                });
                                // change
                                _provincePressed(carTwoPart);

                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text("NO"),
                              onPressed: () {
                                debugPrint(carTwoPart.toString());

                                setState(() {

                                  checkForDeletePart(carTwoPart); // for test

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
                      color: checkForSelectPart(carTwoPart) //for test
                          ? Colors.red
                          : Colors.transparent
                  )
              )
          )
        ]
        ),
        clipper: PathClipper(carTwoPart));
  }

  bool checkForSelectPart(CarTwo carTwoPart){
    for (int i = 0 ; i < paintPart.length ; i ++){
      if(paintPart[i].car == carTwoPart.car){
        return true;
      }
    }
    return false ;
  }

  bool checkForDeletePart(CarTwo carTwoPart){
    for (int i = 0 ; i < paintPart.length ; i ++){
      if(paintPart[i].car == carTwoPart.car){
        paintPart.remove(paintPart[i]);
        return true;
      }
    }
    return false ;
  }

  void _provincePressed(CarTwo carTwoPart) {
    setState(() {
      _pressedProvince = carTwoPart.car;
    });
  }
}


class PathPainter extends CustomPainter {
  final CarTwo _province;
  PathPainter(this._province);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = getPathByProvince(_province.car);
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
  final CarTwo _province;
  PathClipper(this._province);

  @override
  Path getClip(Size size) {
    return getPathByProvince(_province.car);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
