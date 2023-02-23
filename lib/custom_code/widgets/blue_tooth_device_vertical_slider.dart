// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_sliders/sliders.dart';

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
  double _value = 40.0;
  @override
  Widget build(BuildContext context) {
    return SfSlider.vertical(
      min: 0.0,
      max: 100.0,
      value: _value,
      interval: 20,
      showTicks: true,
      showLabels: true,
      minorTicksPerInterval: 1,
      onChanged: (dynamic value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}
