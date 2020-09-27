import 'dart:ui';

import 'package:built_path_annotations/built_path_annotations.dart';
part 'map_svg_data_for_car_two.svg_path.g.dart';

enum Province2 {
  side1,
  side2,
  side3,
  side4 ,
  side5,
  side6 ,
  side7 ,
//  topBar,
//  downBar,

}

Path getPathByProvince(Province2 province) {
  switch (province) {
    case Province2.side1:
      return MapSvgData.side1;
    case Province2.side2:
      return MapSvgData.side2;
    case Province2.side3:
      return MapSvgData.side3;
    case Province2.side3:
      return MapSvgData.side4;
    case Province2.side4:
      return MapSvgData.side5;
    case Province2.side5:
      return MapSvgData.side6;
    case Province2.side6:
      return MapSvgData.side6;
    case Province2.side7:
      return MapSvgData.side7;
  }
  return Path();
}

/// We can open our exported SVG image, then we put all SVG data we have in the

/// property it belongs to. Our build runner will create Paths for us to use

/// within the app. Run command: flutter packages pub run build_runner build

class MapSvgData {
  /// Height and width of the used SVG image
  static double get height => 500.0;
  static double get width =>  500.0;
  //car image
  @SvgPath(
  'M95.252,283.11c-13.807,0-25.039,11.232-25.039,25.039s11.232,25.039,25.039,25.039s25.039-11.233,25.039-25.039   S109.059,283.11,95.252,283.11z M95.252,318.188c-5.536,0-10.039-4.504-10.039-10.039s4.503-10.039,10.039-10.039   s10.039,4.503,10.039,10.039S100.788,318.188,95.252,318.188z')
      static Path get side1 => _$MapSvgData_side1;

  @SvgPath(
  'M357.012,283.11c-13.807,0-25.04,11.232-25.04,25.039s11.233,25.039,25.04,25.039c13.806,0,25.038-11.233,25.038-25.039   S370.818,283.11,357.012,283.11z M357.012,318.188c-5.536,0-10.04-4.504-10.04-10.039s4.504-10.039,10.04-10.039   c5.535,0,10.038,4.503,10.038,10.039S362.547,318.188,357.012,318.188z')
      static Path get side2 => _$MapSvgData_side2;

  @SvgPath(
  'M409.227,196.421l-66.917-7.645l-35.714-58.056c-10.905-17.728-30.61-28.741-51.424-28.741H133.676   c-34.925,0-65.792,23.518-75.063,57.193l-0.948,3.445c-4.607,16.733-17.845,30.052-34.549,34.762   C9.506,201.217,0,213.773,0,227.914v83.012c0,4.142,3.358,7.5,7.5,7.5h38.557c4.757,22.798,25.006,39.978,49.195,39.978   s44.438-17.18,49.195-39.978h163.37c4.757,22.798,25.006,39.978,49.195,39.978s44.438-17.18,49.195-39.978h40.477   c3.813,0,7.02-2.861,7.452-6.65l5.874-51.483C463.614,228.69,440.834,200.037,409.227,196.421z M15,294.313h31.949   c-0.843,2.938-1.43,5.983-1.724,9.113H15V294.313z M95.252,343.404c-19.44,0-35.255-15.815-35.255-35.255   s15.815-35.256,35.255-35.256s35.255,15.816,35.255,35.256S114.692,343.404,95.252,343.404z M357.012,343.404   c-19.44,0-35.255-15.815-35.255-35.255s15.815-35.256,35.255-35.256s35.255,15.816,35.255,35.256S376.452,343.404,357.012,343.404z    M357.012,257.893c-16.987,0-32.021,8.48-41.122,21.42H182.425c-4.142,0-7.5,3.358-7.5,7.5s3.358,7.5,7.5,7.5h126.284   c-0.843,2.938-1.43,5.983-1.724,9.113H145.279c-2.389-25.504-23.909-45.533-50.027-45.533c-16.987,0-32.021,8.48-41.122,21.42H15   v-51.399c0-7.455,5.012-14.075,12.187-16.098c21.728-6.126,38.947-23.452,44.94-45.218l0.948-3.445   c7.484-27.186,32.405-46.174,60.601-46.174h121.496c15.643,0,30.452,8.277,38.647,21.6l37.626,61.164   c1.207,1.962,3.249,3.26,5.537,3.522l70.541,8.059c16.002,1.831,28.943,12.335,34.67,26.276h-23.413c-4.142,0-7.5,3.358-7.5,7.5   s3.358,7.5,7.5,7.5h26.578c0.052,1.975-0.023,3.975-0.253,5.993l-2.364,20.72h-44.608   C389.033,266.373,373.998,257.893,357.012,257.893z M407.038,303.426c-0.293-3.13-0.881-6.175-1.724-9.113h35.716l-1.04,9.113   H407.038z')
  static Path get side3 => _$MapSvgData_side3;

  @SvgPath(
   'M255.565,215.222h-15.76c-4.142,0-7.5,3.358-7.5,7.5s3.358,7.5,7.5,7.5h15.76c4.142,0,7.5-3.358,7.5-7.5   S259.708,215.222,255.565,215.222z')
  static Path get side4 => _$MapSvgData_side4;

  @SvgPath(
    'M154.846,222.722c0-4.142-3.358-7.5-7.5-7.5h-15.76c-4.142,0-7.5,3.358-7.5,7.5s3.358,7.5,7.5,7.5h15.76   C151.488,230.222,154.846,226.864,154.846,222.722z')
  static Path get side5 => _$MapSvgData_side5;

  @SvgPath(
   'M164.136,283.941c-1.314-3.113-4.658-5.069-8.025-4.546c-3.049,0.474-5.522,2.768-6.213,5.776   c-1.496,6.51,6.051,11.564,11.54,7.829C164.343,291.024,165.476,287.186,164.136,283.941   C163.946,283.491,164.326,284.401,164.136,283.941z')
  static Path get side6 => _$MapSvgData_side6;


  @SvgPath(
   'M286.014,143.391c-6.531-10.637-18.348-17.245-30.841-17.245h-121.5c-24.087,0-45.371,16.217-51.761,39.443l-0.943,3.438   c-2.468,8.956-6.268,24.34-6.429,24.991c-0.553,2.238-0.045,4.606,1.376,6.422c1.422,1.815,3.599,2.876,5.905,2.876h227.64   c2.717,0,5.222-1.469,6.547-3.841c1.326-2.372,1.265-5.275-0.159-7.589L286.014,143.391z M199.352,141.145v47.169h-69.054v-47.018   c1.115-0.098,2.24-0.151,3.375-0.151H199.352z M95.432,173.002l0.944-3.441c2.86-10.395,9.865-18.839,18.922-23.747v42.499H91.432   C92.697,183.321,94.242,177.323,95.432,173.002z M214.352,188.314v-47.169h40.821c7.316,0,14.235,3.868,18.062,10.1l22.807,37.069   H214.352z')
  static Path get side7 => _$MapSvgData_side7;


}
