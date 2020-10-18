import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../widget/car_widget/car_widget.dart';
import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_bloc.dart';
import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_event.dart';
import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_state.dart';

class CarScreen extends StatefulWidget {
  @override
  _CarScreenState createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  final String APP_NAME = "Car App";


  @override
  Widget build(BuildContext context) {

    BlocProvider.of<PaintBloc>(context).add(BuildImageListEvent());
    return  Scaffold(
        appBar: AppBar(
          title: Text(APP_NAME),
        ),
        body:BlocBuilder<PaintBloc , PaintState>(
            builder: (context, state) {
            if (state is ImageListLoadedState){
              return CarWidget(
                pcontext: context,
                carModelList: state.imageList,
                width: 300.0,
                height: 150.0,
                onYes: (carModel) {
                  printMethod(carModel.carSvgParts);
                },
                onNo: (carModel) {
                  print("NO");
                },
                onCancel: (carModel) {
                  print("Cancel");
                },
              );
            }else return SizedBox(height: 10,);
          }),
    );
  }
  /////////////////////////////////////////////////
  ////////////Helper Method///////////////////////
  ///////////////////////////////////////////////

  void printMethod(Path carSvgPath) {
    print(carSvgPath);
  }
}
