
import 'file:///E:/final-clickable-image/lib/screen/switch_between_screen.dart';
import 'package:flutter/material.dart';



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

