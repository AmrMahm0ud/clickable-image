import 'package:flutter/material.dart';



import 'package:clickable_regions/screen/left_view.dart';


class SwitchBetWeenScreens extends StatefulWidget {

  @override
  _SwitchBetWeenScreensState createState() => _SwitchBetWeenScreensState();
}

class _SwitchBetWeenScreensState extends State<SwitchBetWeenScreens> {

  final String APP_NAME = 'Car App';

  final String BACK_VIEW = 'Back View';

  final String UP_VIEW = "Up View";
  final String FRONT_VIEW = "Front View";
  final String LEFT_VIEW = "LEFT_VIEW";
  final String RIGHT_VIEW = "RIGHT_VIEW";


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
          child: Text(BACK_VIEW),
          onPressed: () => navToCarScreen(),
        ),
        FlatButton(
          color: Colors.grey,
          child: Text(UP_VIEW),
          onPressed: () => navToCarScreen(),
        ),
        FlatButton(
          color: Colors.grey,
          child: Text(FRONT_VIEW),
          onPressed: () => navToCarScreen(),
        ),
        FlatButton(
          color: Colors.grey,
          child: Text(LEFT_VIEW),
          onPressed: () => navToCarScreen(),
        ),
        FlatButton(
          color: Colors.grey,
          child: Text(RIGHT_VIEW),
          onPressed: () => navToCarScreen(),
        ),
      ],
    ),
    );
  }
  ///////////////////////////////////////////////////////////////
  ////////////////////Helper Method/////////////////////////////
  /////////////////////////////////////////////////////////////

  void navToCarScreen(){
    Navigator.push(context , MaterialPageRoute(builder: (context) => CarScreen() ));
  }
}


