import 'package:clickable_regions/screen/car_screen.dart';
import 'package:flutter/material.dart';

class SwitchBetWeenScreens extends StatefulWidget {
  @override
  _SwitchBetWeenScreensState createState() => _SwitchBetWeenScreensState();
}

class _SwitchBetWeenScreensState extends State<SwitchBetWeenScreens> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car App"),
      ),
    body: Column(
      children: [
//        FlatButton(
//          color: Colors.grey,
//          child: Text("test"),
//          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CarSvgWidget(Colors.red , 200.0 , 200.0))),
//        ),
        FlatButton(
          color: Colors.grey,
          child: Text("Car4"),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder:  (context) => CarApp()),
        ),
        ),

      ],
    ),
    );
  }
}
