import 'package:flutter/material.dart';

import '../api/ComputerControlApi.dart';

class SliderVolume extends StatefulWidget {

  @override
  _SliderVolumeState createState() => _SliderVolumeState();
}

class _SliderVolumeState extends State<SliderVolume> {
  double _currentSliderValue = 0;

  changeVolume(int levelVolume) async {
    ComputerControlApi.changeVolume(levelVolume);
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      label: _currentSliderValue.round().toString(),
      onChanged: (double values) {
        setState(() {
          changeVolume(values.toInt());
          _currentSliderValue = values;
        });
      },
    );
  }
}