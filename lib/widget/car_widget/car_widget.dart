import 'package:clickable_regions/model/path_model.dart';
import'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;

import 'package:clickable_regions/model/car_model.dart';
import 'package:clickable_regions/widget/car_widget/path_clipper.dart';
import 'package:clickable_regions/widget/car_widget/path_painter.dart';
import 'package:clickable_regions/svg_parser/path_parser.dart';


class CarWidget extends StatefulWidget {
   final width ;
   final height ;
   final Color unSelectedPartColor;
   final Color selectedPartColor;
   final bool isLandScape;
   final double borderPathWidth;
   final Function(CarModel car) onYes ;
   final Function(CarModel car) onNo ;
   final Function(CarModel car) onCancel ;
   final String svgPath ;
   final List clickableParts ;



   CarWidget({
   @required this.svgPath,
   @required this.width,
   @required this.height,
   @required this.onYes,
   @required this.onNo,
   @required this.onCancel,

   this.clickableParts,
   this.unSelectedPartColor=Colors.white,
   this.selectedPartColor=Colors.red,
   this.isLandScape = true,
   this.borderPathWidth = 1.0,
   });

  @override
  _CarWidgetState createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  final String BUTTON_CANCEL = "Cancel";
  final String BUTTON_YES = "Yes" ;
  final String BUTTON_NO = "No";
  final String TEXT_ASK_TO_PAINT = "Do You Want To Paint It";
  bool loadingState = false;
  CarModel carModel ;
  List<CarModel> svgImageList = [];
  List<Path> paths = [];


  @override
  void initState() {
    super.initState();
    parseSvgToPath();
  }

  @override
  Widget build(BuildContext context) {
    ///interactiveViewer used to zoom and RotatedBox used to Rotated car Clockwise
      return InteractiveViewer(
       ///InteractiveViewer take min scale and maxScale in other words max zoom out and zoom in
        minScale: 0.5,
        maxScale: 4,
        child: Center(
          child: RotatedBox(
            ///quarterTurns take the number of cloukwise round you need your widget to take .. in this widget we used 0 or 1 only
            quarterTurns: widget.isLandScape ? 1 : 0 ,
                child: Container(
                    width:  widget.width,
                    height: widget.height,
                    ///here we put all widget in a stack
                    child: Transform.scale(
                      scale: 1.5,
                      child: loadingState ? CircularProgressIndicator() : Stack(children: _buildSvgImage()
                      ),
                    ),
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
    ///ClipPath to clip the Contaner in the shap of the path
    return ClipPath(
        child: Stack(
            children: <Widget>[
              Material(
                  color: widget.unSelectedPartColor,
                  child: InkWell(
                      onTap: () => _showDialogBox(car),
                      child: Container(
                        color: car.color == widget.selectedPartColor
                            ? widget.selectedPartColor
                            : widget.unSelectedPartColor,
                      )
                  )
              ),
              ///custom paint to draw the path
              ///PathPainter take the path and the width
              CustomPaint(painter: PathPainter(car.pathModel.path , widget.borderPathWidth)),
            ]
        ),
        /// you must send the path to pathclipper to clip the contaner
        clipper: PathClipper(car.pathModel.path));
  }

  ///used to build car Image List
  List<Widget> _buildSvgImage() {
    ///i used the list path to build list of widget
    var list = svgImageList;
    List<Widget> carPaths = [];
    list.forEach((element) {
      carPaths.add(_buildCarParts(element));
    });
    setState(() {
      loadingState = false ;
    });
    return carPaths;
  }
 ///Yes FlatButton to paint the pressed part
  Widget yesFlatButton(CarModel car){
   return FlatButton(
      child: Text(BUTTON_YES),
      onPressed: () {
        ///here you must git the currentindex and send it to paintpart method
        int currentIndex = svgImageList.indexOf(car);
        paintPart(car.pathModel.path , currentIndex);
        widget.onYes(car);
        navPop();
      },
    );
  }
  ///here this method used to undo the paint part
  Widget noFlatButton(CarModel car){
    return FlatButton(
      child: Text(BUTTON_NO),
      onPressed: () {
        ///here you must git the currentindex and send it to Unpaintpart method
        int currentIndex = svgImageList.indexOf(car);
        unPaintPart(car.pathModel.path , currentIndex);
        widget.onNo(car);
        navPop();
      },
    );
  }

  /// this only to pop dialog
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
        svgImageList[currentIndex].color = widget.selectedPartColor;
      });
  }

  void unPaintPart(Path carPath , int currentIndex){
      setState(() {
        svgImageList[currentIndex].color = widget.unSelectedPartColor;
      });
  }

  void navPop(){
    Navigator.pop(context);
  }
  ///this dialod show when part is clicked
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


  void buildSvgImageList(List<Path> imagePathList , List imagePathName ){
    //List <String> clickAbleList = ['CarParts.EKSEDAMLF','CarParts.RFRFLB','CarParts.DOORLB','CarParts.DOORLF','CarParts.LIGHTSPOTLB','CarParts.WHEELLF','CarParts.GLASSLB','CarParts.SHORAALB','CarParts.RFRFLF','CarParts.ATBL','CarParts.EKSDAMLB','CarParts.LIGHTSPOTLF'];
    for(int i = 0 ; i < imagePathList.length ; i ++ ){
      svgImageList.add(CarModel(PathModel(imagePathList[i] , imagePathName[i]) , Colors.white)) ;
    }
  }

  ///give the SVG path to parser
  void parseSvgToPath() async {
    SvgParser parser = SvgParser();

  List pathName = await getPathNameFromXml(context);

    parser.loadFromFile(widget.svgPath).then((value) {
      setState(() {
        paths = parser.getPaths();
        buildSvgImageList(paths , pathName);
      });
    });
  }


 Future<List> getPathNameFromXml(BuildContext context) async {
      List pathNames  = [] ;
    String xmlString = await DefaultAssetBundle.of(context)
        .loadString("assets/images/hatchback.svg");

    var raw = xml.XmlDocument.parse(xmlString);
    raw.findAllElements("path").map((e) => e.attributes).forEach((element) {
      var name = element.firstWhere(
            (attr) => attr.name.local == "id",
      );
      pathNames.add(name);
    });
  return pathNames;
  }



}




