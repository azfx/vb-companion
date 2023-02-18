// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future<String> connectToVBBlueTooth() async {
  // Add your function code here!

  const deviceNameFilter = "Vision Buddy";
  const serviceIDFilter = "37200001-7638-4216-B629-96AD40F79BB1";

  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  if (flutterBlue.isOn != true) {
    return "ERROR:BLUETOOTH_OFF";
  }
  List<BluetoothDevice> connectedDevices = await flutterBlue.connectedDevices;
  List<BluetoothDevice> VBConnectedDevices = [];

  connectedDevices.forEach((device) {
    print('${device.name} found!');
    if (device.name == deviceNameFilter) {
      if (!VBConnectedDevices.contains(device)) VBConnectedDevices.add(device);
    }
  });

  if (!VBConnectedDevices.isEmpty) {
    return "CONNECTED:" + VBConnectedDevices.first.id.id;
  }

  // Start scanning
  flutterBlue.startScan(timeout: Duration(seconds: 4));
  List<BluetoothDevice> VBDevices = [];
  // Listen to scan results
  var subscription = flutterBlue.scanResults.listen((results) {
    // do something with scan results
    for (ScanResult r in results) {
      print('${r.device.name} found! rssi: ${r.rssi}');
      if (r.device.name == deviceNameFilter) {
        if (!VBDevices.contains(r.device)) VBDevices.add(r.device);
        flutterBlue.stopScan();
      }
    }
  });

  if (!VBDevices.isEmpty) {
    BluetoothDevice vbDevice = VBDevices.first;
    try {
      await vbDevice.connect();
      return "CONNECTED:" + vbDevice.id.id;
    } catch (error) {
      return "ERROR:CONNECTION_ERROR";
    }
  }

  flutterBlue.stopScan();

  return "ERROR:SOMETHING";

// // Stop scanning
// flutterBlue.stopScan();

// List<BluetoothService> services = await device.discoverServices();
// services.forEach((service) {
//     // do something with service
//     print('Service with uuid ${service.uuid} found!');
// });
}
