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

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import "dart:typed_data";

class BlueToothDeviceVerticalSlider extends StatefulWidget {
  const BlueToothDeviceVerticalSlider({
    Key? key,
    this.width,
    this.height,
    this.displayName,
    required this.fieldName,
    required this.value,
    required this.min,
    required this.max,
    required this.showLabels,
    required this.showTicks,
    required this.enableTooltip,
    required this.interval,
    required this.minorTicksPerInterval,
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
  final bool showLabels;
  final bool showTicks;
  final bool enableTooltip;
  final int interval;
  final int minorTicksPerInterval;

  final String deviceID;
  final String serviceID;
  final String charactaristicID;

  final void Function() onChanged;

  @override
  _BlueToothDeviceVerticalSliderState createState() =>
      _BlueToothDeviceVerticalSliderState();
}

class _BlueToothDeviceVerticalSliderState
    extends State<BlueToothDeviceVerticalSlider> {
  Future<BluetoothCharacteristic?>? daFuture;

  double? sliderValue;

  void initState() {
    super.initState();
    // Note here we are not awaiting the user, but rather storing
    // the future in the variable
    daFuture = getCharacteristicForConnectedDevice(
        widget.deviceID,
        widget.serviceID,
        widget.charactaristicID,
        widget.fieldName,
        widget.displayName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: daFuture,
        builder: (context, AsyncSnapshot<BluetoothCharacteristic?> snapshot) {
          if (snapshot.hasData) {
            BluetoothCharacteristic? characteristic = snapshot.data;
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
                  interval: 1,
                  showTicks: widget.showTicks,
                  showLabels: widget.showLabels,
                  enableTooltip: widget.enableTooltip,
                  minorTicksPerInterval: widget.minorTicksPerInterval,
                  onChanged: (dynamic newValue) async {
                    print("new value: ${newValue}");
                    dynamic sliderValues =
                        await FFAppState().currentSliderValue;
                    sliderValues[widget.fieldName] = newValue.toInt();
                    FFAppState().update(() {
                      FFAppState().currentSliderValue = sliderValues;
                      widget.onChanged();
                    });
                  },
                  onChangeEnd: (dynamic newValue) async {
                    await characteristic?.write([0, 0, 0, newValue.toInt()],
                        withoutResponse: false);
                    await characteristic?.read();
                  },
                ));
          } else {
            return LinearProgressIndicator(
                backgroundColor: Colors.black,
                color: Colors.white70,
                minHeight: 1);
          }
        });
  }
}

listenToCharactristicChanges(BluetoothCharacteristic? characteristic,
    String fieldName, String? name) async {
  print("listenToCharactristicChanges called");
  await characteristic?.setNotifyValue(!characteristic.isNotifying);

  // characteristic?.onValueChangedStream.listen((value) async {
  //     dynamic sliderValues =
  //       await FFAppState().currentSliderValue;
  //     int newValue = value[3].toInt();
  //     if (sliderValues[fieldName] != newValue) {
  //       sliderValues[fieldName] = newValue;
  //       print("${name} value changed to: ${value}");
  //       FFAppState().update(() {
  //         FFAppState().currentSliderValue = sliderValues;
  //       });
  //     }
  // });
}

Future<BluetoothCharacteristic?> getCharacteristicForConnectedDevice(
    String deviceID,
    String serviceID,
    String charactaristicID,
    String fieldName,
    String? displayName) async {
  print("Looking for VB Headset..");

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
            BluetoothCharacteristic characteristic = service.characteristics
                .where((c) => c.uuid == Guid(charactaristicID))
                .first;
            listenToCharactristicChanges(
                characteristic, fieldName, displayName);
            return characteristic;
          }
        }
      }
    }
  });
}
