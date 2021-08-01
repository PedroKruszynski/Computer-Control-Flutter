import 'package:flutter/material.dart';

class MouseController extends StatefulWidget {
  const MouseController({ Key? key }) : super(key: key);

  @override
  _MouseControllerState createState() => _MouseControllerState();
}

class _MouseControllerState extends State<MouseController> {
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
            child: Container(
              child: Text('Right Click', textAlign: TextAlign.center),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                
              ),
              child: Text('Left Click', textAlign: TextAlign.center),
            ),
          ),
        ]
      ),
    );
  }
}