import 'package:flutter/material.dart';

import './widget/SliderVolume.dart';
import './widget/MouseController.dart';

main() => runApp(new ComputerControl());

class _ComputerControlState extends State<ComputerControl> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Computer Control'),
        ),
        body: Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 25, bottom: 25),
                alignment: Alignment.topCenter,
                child: SliderVolume()
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.grey,
                  child: MouseController()
                ),
              ),
            ],
          )
        ),
      ),
    );
  }

}

class ComputerControl extends StatefulWidget {
  
  @override
  _ComputerControlState createState() {
    return _ComputerControlState();
  }

}