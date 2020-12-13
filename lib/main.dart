
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clickable_regions/screen/switch_between_screen.dart';

import 'clickable_car_widget/car_widget_bloc/car_widget_bloc.dart';
import 'clickable_car_widget/car_widget_bloc/car_widget_repo.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CarWidgetBloc>(
      create: (context) => CarWidgetBloc(CarWidgetRepo()),
      child: MaterialApp(
          title: 'clickable image',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: SwitchBetWeenScreens()),
    );
  }
}

