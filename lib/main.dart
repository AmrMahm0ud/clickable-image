import 'package:flutter/material.dart';


import 'package:clickable_regions/screen/switch_between_screen.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'clickable image ',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SwitchBetWeenScreens());
  }
}

