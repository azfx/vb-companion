// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class BlueToothDeviceVerticalSlider extends StatefulWidget {
  const BlueToothDeviceVerticalSlider({
    Key? key,
    this.width,
    this.height,
    required this.characteristicID,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String characteristicID;

  @override
  _BlueToothDeviceVerticalSliderState createState() =>
      _BlueToothDeviceVerticalSliderState();
}

class _BlueToothDeviceVerticalSliderState
    extends State<BlueToothDeviceVerticalSlider> {
  double _value = 4.0;
  @override
  Widget build(BuildContext context) {
    return SfSliderTheme(
        data: SfSliderThemeData(
            activeLabelStyle: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            inactiveLabelStyle: TextStyle(color: Colors.white70, fontSize: 16),
            activeTrackColor: Colors.white,
            inactiveTrackColor: Colors.white30,
            thumbColor: Colors.yellow,
            activeTrackHeight: 2.0,
            inactiveTrackHeight: 1.0),
        child: SfSlider.vertical(
          min: 1.0,
          max: 10.0,
          value: _value.toInt(),
          interval: 1,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          minorTicksPerInterval: 1,
          onChanged: (dynamic value) {
            setState(() {
              _value = value;
            });
          },
        ));
  }
}
