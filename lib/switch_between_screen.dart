
import 'package:clickable_regions/widget/car_one_widget/car_one_widget.dart';
import 'package:clickable_regions/widget/car_two_widget/car_two_widget.dart';
import 'package:flutter/material.dart';

class SwitchBetWeenScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car App"),
      ),
    body: Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlatButton(
          child: Text("Car1"),
          color: Colors.grey,
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder:  (context) => CarOnePage())),
        ),
        FlatButton(
          color: Colors.grey,
          child: Text("Car2"),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder:  (context) => CarTwoPage())),
        ),
      ],
    ),
    );
  }
}
