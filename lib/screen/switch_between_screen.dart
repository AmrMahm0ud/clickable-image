import 'package:clickable_regions/screen/car_screen.dart';
import 'package:flutter/material.dart';

class SwitchBetWeenScreens extends StatefulWidget {

  @override
  _SwitchBetWeenScreensState createState() => _SwitchBetWeenScreensState();
}

class _SwitchBetWeenScreensState extends State<SwitchBetWeenScreens> {
  final String APP_NAME = 'Car App';
  final String  BUTTON_NAME= 'Side Car';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_NAME),
      ),
    body: Column(
      children: [
        FlatButton(
          color: Colors.grey,
          child: Text(BUTTON_NAME),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder:  (context) => CarScreen()),
        ),
        ),
      ],
    ),
    );
  }
}
