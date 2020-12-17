import 'package:clickable_regions/clickable_car_widget/model/car_model.dart';
import 'package:clickable_regions/clickable_car_widget/model/path_model.dart';
import 'package:clickable_regions/clickable_car_widget/svg_parser/path_parser.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:flutter/cupertino.dart';

import 'car_widget_state.dart';

abstract class CarWidgetRepository {
  Future<CarWidgetState> extractPathAndName(
      BuildContext context, String svgPath);
  CarWidgetState selectPart(CarModel carModel);
  CarWidgetState unSelectPart(CarModel carModel);
  CarWidgetState cancel();
}

class CarWidgetRepo extends CarWidgetRepository {
  List<CarModel> imageCarList = [];

  ///extractPath and name from xml file
  @override
  Future<CarWidgetState> extractPathAndName(
      BuildContext context, String svgPath) async {
    CarWidgetState carWidgetState;
    List pathsNames = [];
    List paths = [];

    ///extract Path Name
    pathsNames = await getPathNameFromXml(context, svgPath);

    ///extract Paths
    paths = await parseSvgToPath(context, svgPath);

    ///build image list
    imageCarList = buildSvgImageList(paths, pathsNames);
    carWidgetState = ImageListLoadedState(imageCarList);
    return carWidgetState;
  }

  ///give the SVG path to parser
  Future<List> parseSvgToPath(BuildContext context, String svgPath) async {
    SvgParser parser = SvgParser();
    List paths;

    ///Get the paths from Svg file
    await parser.loadFromFile(svgPath).then((value) {
      paths = parser.getPaths();
    });
    return paths;
  }

  ///get Path Name
  Future<List> getPathNameFromXml(BuildContext context, String svgPath) async {
    List pathNames = [];

    ///extract path name
    String xmlString = await DefaultAssetBundle.of(context).loadString(svgPath);
    var raw = xml.XmlDocument.parse(xmlString);
    raw.findAllElements("path").map((e) => e.attributes).forEach((element) {
      var name = element.firstWhere(
        (attr) => attr.name.local == "id",
      );
      pathNames.add(name);
    });
    pathNames.toString();

    return pathNames;
  }

  ///create svgImageList from imagePathList and imagePathName
  List buildSvgImageList(List<Path> imagePathList, List imagePathName) {
    List clickAbleList = [
      'id="eksedam-LF"',
      'id="rfrf-LB"',
      'id="door-LB"',
      'id="door-LF"',
      'id="light-spot-LB"',
      'id="wheel-LF"',
      'id="glass-LB"',
      'id="shoraa-LB"',
      'id="rfrf-LF"',
      'id="atbl"',
      'id="eksedam-LB"',
      'id="light-spot-LF"'
    ];
    List<CarModel> svgImageList = [];
    for (int i = 0; i < imagePathList.length; i++) {
      svgImageList.add(CarModel(PathModel(imagePathList[i], imagePathName[i]),
          Colors.white, !clickAbleList.contains(imagePathName[i])));
    }
    return svgImageList;
  }

  @override
  CarWidgetState selectPart(CarModel carModel) {
    CarWidgetState carWidgetState;

    ///Get the index of select part
    int index = imageCarList.indexOf(carModel);

    ///change the Color
    imageCarList[index].color = Colors.red;

    carWidgetState = SelectedState(imageCarList);

    return carWidgetState;
  }

  @override
  CarWidgetState unSelectPart(CarModel carModel) {
    /// get the index of selected part
    int index = imageCarList.indexOf(carModel);

    ///change Color
    imageCarList[index].color = Colors.white;
    return UnSelectedState(imageCarList);
  }

  @override
  CarWidgetState cancel() {
    return CancelState(imageCarList);
  }
}
