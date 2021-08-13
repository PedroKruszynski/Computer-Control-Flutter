import 'package:flutter/material.dart';

import '../api/ComputerControlApi.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MouseController extends StatefulWidget {
  const MouseController({ Key? key }) : super(key: key);

  @override
  _MouseControllerState createState() => _MouseControllerState();
}

class _MouseControllerState extends State<MouseController> {

  _MouseControllerState () {
    accelerometerEvents.listen((AccelerometerEvent event) {

      ComputerControlApi.mousePosition(event.x, event.z);
    });
  }

  rightClick() async {
    ComputerControlApi.mouseRightClick();
  }

  leftClick(doubleTap) async {
    ComputerControlApi.mouseLeftClick(doubleTap);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 0.5
          )
        )
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
                onTap: () {
                  leftClick(false);
                },
                onDoubleTap: () {
                  leftClick(true);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey
                  ),
                  height: double.infinity,
                  child: Center(
                    child: Text('Left Click'),
                  ),
                ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)
            ),
          ),
          Expanded(
            child: GestureDetector(
                onTap: () {
                  rightClick();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey
                  ),
                  height: double.infinity,
                  child: Center(
                    child: Text('Right Click'),
                  ),
                ),
            ),
          ),
        ]
      ),
    );
  }
}