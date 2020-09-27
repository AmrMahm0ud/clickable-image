import 'package:flutter/material.dart';

import '../../model/model.dart';
import 'map_svg_data.dart';




class CarOnePage extends StatefulWidget {
  CarOnePage({Key key}) : super(key: key);

 // final String title;

  @override
  _CarOnePageState createState() => _CarOnePageState();
}

class _CarOnePageState extends State<CarOnePage> {
  Province _pressedProvince;

  List<Pro> paintPart = []; // change
  List<Pro> buildMap = [] ;
  Pro p ;


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
  List <Pro> _buildList(){
    for (int i = 0 ; i < Province.values.length ; i ++ ){
      buildMap.add(Pro(Province.values[i] , Colors.transparent));
    }
    return buildMap;
  }




  Widget _buildProvince(Pro province) {
    return ClipPath(
        child: Stack(children: <Widget>[
          CustomPaint(
              painter: PathPainter(province)),
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

                                p = Pro(province.pro , Colors.red);

                                setState(() {
                                  paintPart.add(p);
                                });
                                // change
                                _provincePressed(province);

                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text("NO"),
                              onPressed: () {
                                debugPrint(province.toString());

                                setState(() {

                                  checkForDeletePart(province); // for test

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
                      color: checkForSelectPart(province) //for test
                          ? Colors.red
                          : Colors.transparent
                  )
              )
          )
        ]
        ),
        clipper: PathClipper(province));
  }

  bool checkForSelectPart(Pro province){
    for (int i = 0 ; i < paintPart.length ; i ++){
      if(paintPart[i].pro == province.pro){
        return true;
      }
    }
    return false ;
  }

  bool checkForDeletePart(Pro province){
    for (int i = 0 ; i < paintPart.length ; i ++){
      if(paintPart[i].pro == province.pro){
        paintPart.remove(paintPart[i]);
        return true;
      }
    }
    return false ;
  }

  void _provincePressed(Pro province) {
    setState(() {
      _pressedProvince = province.pro;
    });
  }
}

























class PathPainter extends CustomPainter {
  final Pro _province;
  PathPainter(this._province);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = getPathByProvince(_province.pro);
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
  final Pro _province;
  PathClipper(this._province);

  @override
  Path getClip(Size size) {
    return getPathByProvince(_province.pro);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
