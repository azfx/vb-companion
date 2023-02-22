// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'index.dart'; // Imports other custom widgets
import 'dart:async';

import "dart:typed_data";

final Completer<BluetoothDevice?> vbDevice = new Completer<BluetoothDevice?>();

class BlueToothDeviceSlider extends StatefulWidget {
  const BlueToothDeviceSlider({
    Key? key,
    this.width,
    this.height,
    required this.min,
    required this.max,
    required this.deviceID,
    required this.serviceID,
    required this.charactaristicID,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double min;
  final double max;

  final String deviceID;
  final String serviceID;
  final String charactaristicID;

  @override
  _BlueToothDeviceSliderState createState() => _BlueToothDeviceSliderState();
}

class _BlueToothDeviceSliderState extends State<BlueToothDeviceSlider> {
  Future<BluetoothService?>? daFuture;

  void initState() {
    super.initState();
    // Note here we are not awaiting the user, but rather storing
    // the future in the variable
    daFuture = getServicesForConnectedDevice(widget.deviceID, widget.serviceID);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: daFuture,
        builder: (context, AsyncSnapshot<BluetoothService?> snapshot) {
          if (snapshot.hasData) {
            BluetoothService? service = snapshot.data;
            BluetoothCharacteristic? characteristic = service?.characteristics
                .where((c) => c.uuid == Guid(widget.charactaristicID))
                .first;
            return Slider.adaptive(
              activeColor: Color(0xFFFFFF00),
              inactiveColor: FlutterFlowTheme.of(context).lineColor,
              min: widget.min,
              max: widget.max,
              value: FFAppState()
                  .brightness
                  .toDouble()
                  .clamp(widget.min, widget.max),
              label: FFAppState().brightness.toInt().toString(),
              divisions: 127,
              onChanged: (newValue) async {
                newValue = double.parse(newValue.toStringAsFixed(0));
                FFAppState()
                    .update(() => FFAppState().brightness = newValue.toInt());
                print(int32bytes(newValue.toInt()));
                await characteristic?.write(int32bytes(newValue.toInt()),
                    withoutResponse: false);
                await characteristic?.read();
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

Uint8List int32bytes(int value) => Uint8List(4)
  ..buffer.asByteData().setInt32(0, value, Endian.big); // 175 = [0,0,0,175];

Future<BluetoothService?> getServicesForConnectedDevice(
    String deviceID, String serviceID) async {
  print("Looking for VB Headset..");

  const deviceNameFilter = "Vision Buddy";
  const serviceIDFilter = "37200001-7638-4216-B629-96AD40F79BB1";

  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  bool bluetoothIsOn = await flutterBlue.isOn;
  return Future(() async {
    List<BluetoothDevice> connectedDevices = await flutterBlue.connectedDevices;
    List<BluetoothService>? services;
    for (final device in connectedDevices) {
      print('${device.name} found in settings!');
      print("!${device.id.id}!");
      print("!${deviceID}!");
      if (device.id.id == deviceID) {
        print('${device.id} matches ${deviceID}');
        services = await device.discoverServices();
        for (var service in services) {
          if (service.uuid == Guid(serviceID)) {
            return service;
          }
        }
      }
    }
  });
}
