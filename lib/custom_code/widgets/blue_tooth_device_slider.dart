// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'index.dart'; // Imports other custom widgets
import 'dart:async';

import "dart:typed_data";

final Completer<BluetoothDevice?> vbDevice = new Completer<BluetoothDevice?>();

class BlueToothDeviceSlider extends StatefulWidget {
  const BlueToothDeviceSlider({
    Key? key,
    this.width,
    this.height,
    this.displayName,
    required this.fieldName,
    required this.value,
    required this.min,
    required this.max,
    required this.deviceID,
    required this.serviceID,
    required this.charactaristicID,
    required this.onChanged,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? displayName;
  final String fieldName;
  final double min;
  final double max;
  final double value;

  final String deviceID;
  final String serviceID;
  final String charactaristicID;

  final void Function() onChanged;

  @override
  _BlueToothDeviceSliderState createState() => _BlueToothDeviceSliderState();
}

class _BlueToothDeviceSliderState extends State<BlueToothDeviceSlider> {
  Future<BluetoothService?>? daFuture;

  double? sliderValue;

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
            return SfSliderTheme(
                data: SfSliderThemeData(
                    activeLabelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    inactiveLabelStyle:
                        TextStyle(color: Colors.white70, fontSize: 16),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: FlutterFlowTheme.of(context).lineColor,
                    thumbColor: FlutterFlowTheme.of(context).tertiaryColor,
                    activeTrackHeight: 2.0,
                    inactiveTrackHeight: 1.0),
                child: SfSlider(
                  min: widget.min,
                  max: widget.max,
                  value: widget.value.toDouble().clamp(widget.min, widget.max),
                  interval: 10,
                  showTicks: false,
                  showLabels: false,
                  enableTooltip: true,
                  minorTicksPerInterval: 1,
                  onChanged: (dynamic newValue) async {
                    dynamic sliderValues =
                        await FFAppState().currentSliderValue;
                    sliderValues[widget.fieldName] = newValue.toInt();
                    FFAppState().update(() {
                      FFAppState().currentSliderValue = sliderValues;
                      widget.onChanged();
                    });
                  },
                  onChangeEnd: (dynamic newValue) async {
                    newValue = double.parse(newValue.toStringAsFixed(0));
                    print(int32bytes(newValue.toInt()));
                    await characteristic?.write(int32bytes(newValue.toInt()),
                        withoutResponse: false);
                    await characteristic?.read();
                  },
                ));
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
