// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future initializeDevice(String deviceID) async {
  // Add your function code here!
  const deviceNameFilter = "Vision Buddy";
  const serviceIDFilter = "37200001-7638-4216-B629-96AD40F79BB1";

  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  bool bluetoothIsOn = await flutterBlue.isOn;

  Future.delayed(const Duration(milliseconds: 500), () async {
    print('Initializing connected device');
    await flutterBlue.isOn;
    List<BluetoothDevice> connectedDevices = await flutterBlue.connectedDevices;
    connectedDevices.forEach((device) {
      print('${device.name} found!');
      if (device.id.id == deviceID) {
        print('${device.name} matches ${deviceID}');
      }
    });
  });
}
