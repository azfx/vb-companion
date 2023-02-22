// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

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
    FFAppState().update(
        () => FFAppState().connectedDeviceID = VBConnectedDevices.first.id.id);
    return "CONNECTED:" + VBConnectedDevices.first.id.id;
  }

  // Start scanning
  flutterBlue.startScan(timeout: Duration(seconds: 4));
  BluetoothDevice connectedDevice;

  final Completer<BluetoothDevice> c = new Completer<BluetoothDevice>();

  var subscription = flutterBlue.scanResults.listen((results) async {
    // do something with scan results
    for (ScanResult r in results) {
      //print('${r.device.name} found! rssi: ${r.rssi}');
      if (r.device.name == deviceNameFilter) {
        //print('Subscription: ${r.device.name} matches ${deviceNameFilter}');
        await r.device.connect();
        if (!c.isCompleted) c.complete(r.device);
        flutterBlue.stopScan();
        break;
      }
    }
  });

  Future.delayed(const Duration(milliseconds: 4000), () {
    flutterBlue.stopScan();
    if (!c.isCompleted)
      c.completeError("No devices found"); // Stop scanning after 4 seconds
  });

  try {
    connectedDevice = await c.future;
    FFAppState()
        .update(() => FFAppState().connectedDeviceID = connectedDevice.id.id);
    return "CONNECTED:${connectedDevice.id.id}";
  } catch (error) {
    print(error);
    FFAppState().update(() => FFAppState().connectedDeviceID = "");
    return "Error: No Devices Found.";
  }
}
