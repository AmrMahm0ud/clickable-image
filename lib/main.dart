import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clickable_regions/screen/switch_between_screen.dart';
import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_repo.dart';
import 'bloc/paint_bloc/paint_bloc_bloc.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaintBloc>(
      create: (context) => PaintBloc(PaintRepostrey()),
      child: MaterialApp(
          title: 'clickable image ',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: SwitchBetWeenScreens()),
    );
  }
}

