// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart';

class BlueToothDeviceSlider extends StatefulWidget {
  const BlueToothDeviceSlider({
    Key? key,
    this.width,
    this.height,
    required this.deviceID,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String deviceID;

  @override
  _BlueToothDeviceSliderState createState() => _BlueToothDeviceSliderState();
}

class _BlueToothDeviceSliderState extends State<BlueToothDeviceSlider> {
  @override
  Widget build(BuildContext context) {
    return Slider.adaptive(
      activeColor: Color(0xFFFFFF00),
      inactiveColor: FlutterFlowTheme.of(context).lineColor,
      min: 128,
      max: 255,
      value: FFAppState().brightness.toInt(),
      label: FFAppState().brightness.toInt().toString(),
      divisions: 127,
      onChanged: (newValue) {
        newValue = double.parse(newValue.toStringAsFixed(0));
        setState(() => FFAppState().brightness = newValue);
      },
    );
  }
}
