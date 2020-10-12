//import 'package:clickable_regions/model/model_for_car_four.dart';
//import 'package:flutter/material.dart';
//
//import 'car_four_svg_data.dart';
//
//class CarFourPage extends StatefulWidget {
// // final List<CarModel> carmodel;
//  CarFourPage({Key key}) : super(key: key);
//
//  @override
//  _CarFourPageState createState() => _CarFourPageState();
//}
//
//class _CarFourPageState extends State<CarFourPage> {
//  CarFour _pressedProvince;
//  List<CarFour> buildSvgImage = [];
//  CarFour _carOne;
//
//  @override
//  void initState() {
//    super.initState();
//    for (int i = 0; i < CarFourParts.values.length; i++) {
//      buildSvgImage.add(CarFour(CarFourParts.values[i], Colors.white10));
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    /// Calculate the center point of the SVG map,
//    /// use parent widget for width/heigth.
//    double width = MediaQuery.of(context).size.width;
//    double height = MediaQuery.of(context).size.height;
//    double navBarHeight =
//        Theme.of(context).platform == TargetPlatform.android ? 56.0 : 44.0;
//    double safeZoneHeight = MediaQuery.of(context).padding.bottom;
//    double scaleFactor = 0.5;
//    double x = (width / 2.0) - (MapSvgData.width / 2.0);
//    double y = (height / 2.0) -
//        (MapSvgData.height / 2.0) -
//        (safeZoneHeight / 2.0) -
//        navBarHeight;
//    Offset offset = Offset(x, y);
//    return Scaffold(
//        appBar: AppBar(title: Text('Map Image')),
//        body: SafeArea(
//            child: Transform.scale(
//                scale: ((height / MapSvgData.height)) * scaleFactor,
//                child: Container(
//                  width: double.infinity,
//                  height: double.infinity,
//                  child: Transform.translate(
//                    offset: offset,
//                    child: RotatedBox(
//                        quarterTurns: 1,
//                        child: Stack(children: _buildSvgImage())),
//                  ),
//                )
//            )
//        )
//    );
//  }
//
//  //using for build map
//  List<Widget> _buildSvgImage() {
//    var list = buildSvgImage;
//    List<Widget> carFourPaths = List(list.length);
//    for (int i = 0; i < list.length; i++) {
//      carFourPaths[i] = _buildCar(list[i]);
//    }
//    return carFourPaths;
//  }
//
//  Widget _buildCar(Car car) {
//    return ClipPath(
//        child: Stack(children: <Widget>[
//          CustomPaint(painter: PathPainter(car)),
//          Material(
//              color: Colors.white10,
//              child: InkWell(
//                  onTap: () => showDialog(
//                      context: context,
//                      builder: (_) => AlertDialog(
//                            title: Text("Do You want to paint it "),
//                            actions: [
//                              FlatButton(
//                                child: Text("yes"),
//                                onPressed: () {
//                                  //_carOne = CarFour(car.carSvgParts, Colors.red);
//                                  for (int i = 0; i < buildSvgImage.length; i++) {
//                                    if (buildSvgImage[i].carSvgParts == car.carSvgParts) {
//                                      setState(() {
//                                        buildSvgImage[i].color = Colors.red;
//                                      });
//                                    }
//                                  }
//                                  _carPartPressed(car);
//                                  Navigator.pop(context);
//                                },
//                              ),
//                              FlatButton(
//                                child: Text("NO"),
//                                onPressed: () {
//                                  for (int i = 0; i < buildSvgImage.length; i++) {
//                                    if (buildSvgImage[i].carSvgParts == car.carSvgParts) {
//                                      setState(() {
//                                        buildSvgImage[i].color = Colors.white10;
//                                      });
//                                    }
//                                  }
//                                  Navigator.pop(context);
//                                },
//                              ),
//                              FlatButton(
//                                child: Text("Cancel"),
//                                onPressed: () {
//                                  Navigator.pop(context);
//                                },
//                              )
//                            ],
//                          )),
//                  child: Container(
//                      padding: EdgeInsets.all(2.0),
//                      color: car.color == Colors.red //for test
//                          ? Colors.red
//                          : Colors.white10
//                          )
//                          )
//                          )
//        ]),
//        clipper: PathClipper(car));
//  }
//
//  void _carPartPressed(CarFour province) {
//    setState(() {
//      _pressedProvince = CarFour(province.carSvgParts, province.color);
//    });
//  }
//}
//
//class PathPainter extends CustomPainter {
//  final CarFour _carPart;
//  PathPainter(this._carPart);
//
//  @override
//  void paint(Canvas canvas, Size size) {
//    Path path = getPathByProvince(_carPart.carSvgParts);
//    canvas.drawPath(
//        path,
//        Paint()
//          ..style = PaintingStyle.stroke
//          ..color = Colors.black
//          ..strokeWidth = 1.0);
//  }
//
//  @override
//  bool shouldRepaint(PathPainter oldDelegate) => true;
//
//  @override
//  bool shouldRebuildSemantics(PathPainter oldDelegate) => false;
//}
//
//class PathClipper extends CustomClipper<Path> {
//  final CarFour _carPart;
//  PathClipper(this._carPart);
//
//  @override
//  Path getClip(Size size) {
//    return getPathByProvince(_carPart.carSvgParts);
//  }
//
//  @override
//  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
//}
