// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future getEDIDsFromHeadset(String deviceID) async {
  // Add your function code here!
  const deviceName = "Vision Buddy";
  const serviceID = "37200001-7638-4216-B629-96AD40F79BB1";

  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  //bool bluetoothIsOn = await flutterBlue.isOn;

  Future.delayed(const Duration(milliseconds: 500), () async {
    print('Initializing connected device');
    BluetoothDevice device = BluetoothDevice.fromId(deviceID);
    //make sure device is not null
    if (device.id.id == deviceID) {
      print(
          '${device.id} matches ${deviceID}, begin listening to connection state');
      device.state.listen((state) => {
            //print("BluetoothState: ${state.name}");
            FFAppState().update(() => FFAppState().connectionState = state.name)
          });
      List<BluetoothService> services = await device.discoverServices();
      for (var service in services) {
        if (service.uuid == Guid(serviceID)) {
          loadSettingsFromDevice(service);
        }
      }
    }
    /*await flutterBlue.isOn;
    List<BluetoothDevice> connectedDevices = await flutterBlue.connectedDevices;
    for (final device in connectedDevices) {
      print('${device.name} found in settings!');
      print("!${device.id.id}!");
      print("!${deviceID}!");
      if (device.id.id == deviceID) {
        print(
            '${device.id} matches ${deviceID}, begin listening to connection state');
        device.state.listen((state) => {
              //print("BluetoothState: ${state.name}");
              FFAppState()
                  .update(() => FFAppState().connectionState = state.name)
            });
        List<BluetoothService> services = await device.discoverServices();
        for (var service in services) {
          if (service.uuid == Guid(serviceID)) {
            loadSettingsFromDevice(service);
          }
        }
      }
    }*/
  });
}

Future<bool> loadSettingsFromDevice(BluetoothService service) async {
  String edidID = "47200009-7638-4216-B629-96AD40F79BB1";
  print("getEDIDsFromHeadset");
  BluetoothCharacteristic edidCharacteristic =
      service.characteristics.where((c) => c.uuid == Guid(edidID)).first;
  try {
    String edidValue = await getValueFromCharacteristic(edidCharacteristic);
    print("Writing edid value: ${edidValue.toString()} to App state}");
    FFAppState().update(() => FFAppState().edids = edidValue);
    FFAppState().update(() => FFAppState().edidList =
        edidValue.split('\n').where((e) => e.isNotEmpty).toList());

    return true;
  } catch (error) {
    print("loadSettingsFromDevice:Error");
    print(error);
    return false;
  }
}

Future<String> getValueFromCharacteristic(BluetoothCharacteristic c) async {
  List<int> v = await c.read(); // 0x000000AF = [0,0,0,175];
  if (v != null) {
    const asciiDecoder = AsciiDecoder();
    final edids = asciiDecoder.convert(v);
    return edids;
  } else {
    throw Exception("Error reading data from device");
  }
}
