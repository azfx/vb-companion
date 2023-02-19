// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

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
    return Container();
  }
}
