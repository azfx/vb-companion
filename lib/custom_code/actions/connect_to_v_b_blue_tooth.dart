// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'dart:async';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future<String> connectToVBBlueTooth() async {
  // Add your function code here!

  const deviceNameFilter = "Vision Buddy";
  const serviceIDFilter = "37200001-7638-4216-B629-96AD40F79BB1";

  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  bool bluetoothIsOn = await flutterBlue.isOn;
  String result = "";

  // sleep(const Duration(milliseconds: 2000)); // This will block UI thread.

  bluetoothIsOn = await flutterBlue.isOn;

  if (bluetoothIsOn != true) {
    print('flutterBlue.isOn : ${bluetoothIsOn}');

    return "ERROR:BLUETOOTH_OFF";
  }
  List<BluetoothDevice> connectedDevices = await flutterBlue.connectedDevices;
  List<BluetoothDevice> VBConnectedDevices = [];

  connectedDevices.forEach((device) {
    print('${device.name} found!');
    if (device.name == deviceNameFilter) {
      print('${device.name} matches ${deviceNameFilter}');
      if (!VBConnectedDevices.contains(device)) VBConnectedDevices.add(device);
    }
  });

  print('VBConnectedDevices.IsEmpty:  ${VBConnectedDevices.isEmpty}');

  if (!VBConnectedDevices.isEmpty) {
    return "CONNECTED:" + VBConnectedDevices.first.id.id;
  }

  // Start scanning
  flutterBlue.startScan(timeout: Duration(seconds: 4));
  BluetoothDevice connectedDevice;

  final Completer<BluetoothDevice> c = new Completer<BluetoothDevice>();

  var subscription = flutterBlue.scanResults.listen((results) {
    // do something with scan results
    for (ScanResult r in results) {
      print('${r.device.name} found! rssi: ${r.rssi}');
      if (r.device.name == deviceNameFilter) {
        print('Subscription: ${r.device.name} matches ${deviceNameFilter}');
        c.complete(r.device);
        flutterBlue.stopScan();
        break;
      }
    }
  });

  connectedDevice = await c.future;

  if (connectedDevice != null) {
    return "CONNECTED: ${connectedDevice.id.id}";
  } else {
    return "ERROR:SOMETHING";
  }

// // Stop scanning
// flutterBlue.stopScan();

// List<BluetoothService> services = await device.discoverServices();
// services.forEach((service) {
//     // do something with service
//     print('Service with uuid ${service.uuid} found!');
// });
}
