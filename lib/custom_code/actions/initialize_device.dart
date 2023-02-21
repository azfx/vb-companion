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

Future initializeDevice(String deviceID) async {
  // Add your function code here!
  const deviceName = "Vision Buddy";
  const serviceID = "37200001-7638-4216-B629-96AD40F79BB1";

  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  bool bluetoothIsOn = await flutterBlue.isOn;

  Future.delayed(const Duration(milliseconds: 500), () async {
    print('Initializing connected device');
    await flutterBlue.isOn;
    List<BluetoothDevice> connectedDevices = await flutterBlue.connectedDevices;
    for (final device in connectedDevices) {
      print('${device.name} found in settings!');
      print("!${device.id.id}!");
      print("!${deviceID}!");
      if (device.id.id == deviceID) {
        print('${device.id} matches ${deviceID}');
        List<BluetoothService> services = await device.discoverServices();
        for (var service in services) {
          if (service.uuid == Guid(serviceID)) {
            loadSettingsFromDevice(service);
          }
        }
      }
    }
  });
}

Future<bool> loadSettingsFromDevice(BluetoothService service) async {
  String brightnessID = "47200001-7638-4216-B629-96AD40F79BB1";
  String contrastID = "47200002-7638-4216-B629-96AD40F79BB1";
  print("loadSettingsFromDevice");
  BluetoothCharacteristic brightnessCharacteristic =
      service.characteristics.where((c) => c.uuid == Guid(brightnessID)).first;
  try {
    int brightnessValue =
        await getValueFromCharacteristic(brightnessCharacteristic);
    print(
        "Writing brightness value: ${brightnessValue.toString()} to App state}");
    FFAppState().update(() => FFAppState().brightness = brightnessValue);

    return true;
  } catch (error) {
    print("loadSettingsFromDevice:Error");
    print(error);
    return false;
  }
}

Future<int> getValueFromCharacteristic(BluetoothCharacteristic c) async {
  List<int> v = await c.read(); // 0x000000AF = [0,0,0,175];
  if (v != null) {
    return v[3]; // Hack [0,0,0,-> 175 <-]
  } else {
    throw Exception("Error reading data from device");
  }
}
