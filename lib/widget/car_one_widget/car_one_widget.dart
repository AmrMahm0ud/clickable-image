import 'package:flutter/material.dart';

import '../../model/model_for_car_one.dart';
import 'map_svg_data.dart';




class CarOnePage extends StatefulWidget {
  CarOnePage({Key key}) : super(key: key);

 // final String title;

  @override
  _CarOnePageState createState() => _CarOnePageState();
}

class _CarOnePageState extends State<CarOnePage> {
  carOne _pressedProvince;

  List<CarOne> paintPart = []; // change
  List<CarOne> buildSvgImage = [] ;
  CarOne _carOne ;


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
                    offset: offset, child: Container(
                      color:Colors.blue,
                      child: Stack(children: _buildSvgImage()
                ),
                    )
                )
            )
        )
    );
  }

  //using for build map
  List<Widget> _buildSvgImage() {
    var list = _buildList();
    List<Widget> carOnePaths = List(list.length);
    for (int i = 0; i < list.length; i++) {
      carOnePaths[i] = _buildCar(list[i]);
      // print(list[i].pro);
    }
    return carOnePaths;
  }


  //for buildmap using class mobdel
  List <CarOne> _buildList(){
    for (int i = 0 ; i < carOne.values.length ; i ++ ){
      buildSvgImage.add(CarOne(carOne.values[i] , Colors.transparent));
    }
    return buildSvgImage;
  }




  Widget _buildCar(CarOne car) {
    return ClipPath(
        child: Stack(children: <Widget>[
          CustomPaint(
              painter: PathPainter(car)),
          Material(
              color: Colors.transparent,
              child: InkWell
                (
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Do You want to paint it "),
                          actions: [
                            FlatButton(
                              child: Text("yes"),
                              onPressed: () {
                                _carOne = CarOne(car.carParts , Colors.red);
                                setState(() {
                                  paintPart.add(_carOne);
                                });
                                // change
                                _carPartPressed(car);

                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text("NO"),
                              onPressed: () {
                                debugPrint(car.toString());

                                setState(() {

                                  checkForDeletePart(car); // for test

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
                      color: checkForSelectPart(car) //for test
                          ? Colors.red
                          : Colors.transparent
                  )
              )
          )
        ]
        ),
        clipper: PathClipper(car));
  }

  bool checkForSelectPart(CarOne province){
    for (int i = 0 ; i < paintPart.length ; i ++){
      if(paintPart[i].carParts == province.carParts){
        return true;
      }
    }
    return false ;
  }

  bool checkForDeletePart(CarOne province){
    for (int i = 0 ; i < paintPart.length ; i ++){
      if(paintPart[i].carParts == province.carParts){
        paintPart.remove(paintPart[i]);
        return true;
      }
    }
    return false ;
  }

  void _carPartPressed(CarOne province) {
    setState(() {
      _pressedProvince = province.carParts;
    });
  }
}




class PathPainter extends CustomPainter {
  final CarOne _carPart;
  PathPainter(this._carPart);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = getPathByProvince(_carPart.carParts);
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
  final CarOne _carPart;
  PathClipper(this._carPart);

  @override
  Path getClip(Size size) {
    return getPathByProvince(_carPart.carParts);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
