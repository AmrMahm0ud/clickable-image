import'package:flutter/material.dart';
import 'package:clickable_regions/map_svg_data.dart';

import 'model/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clickable SVG map of The Netherlands',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'Clickable SVG map of The Netherlands'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

    List<Widget> provinces = List(Province.values.length);

    for (int i = 0; i < Province.values.length; i++) {

      provinces[i] = _buildProvince(Province.values[i]);
      
      debugPrint(Province.values[i].toString());

    }

    return provinces;

  }

  Widget _buildProvince(Province province) {
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

                                     p = Pro(province , Colors.red);

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

  bool checkForSelectPart(Province province){
    for (int i = 0 ; i < paintPart.length ; i ++){
      if(paintPart[i].pro == province){
        return true;
      }
    }
    return false ;
  }

  bool checkForDeletePart(Province province){
    for (int i = 0 ; i < paintPart.length ; i ++){
      if(paintPart[i].pro == province){
        paintPart.remove(paintPart[i]);
        return true;
      }
    }
    return false ;
  }

  void _provincePressed(Province province) {
    setState(() {
      _pressedProvince = province;
    });
  }
}


class PathPainter extends CustomPainter {
  final Province _province;
  PathPainter(this._province);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = getPathByProvince(_province);
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
  final Province _province;
  PathClipper(this._province);

  @override
  Path getClip(Size size) {
    return getPathByProvince(_province);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
