import 'package:clickable_regions/widget/car_four_widget/car_four_widget.dart';
import 'package:flutter/material.dart';

class SwitchBetWeenScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car App"),
      ),
    body: Column(
      children: [
        FlatButton(
          color: Colors.grey,
          child: Text("Car4"),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder:  (context) => CarFourPage())),
        ),
      ],
    ),
    );
  }
}
