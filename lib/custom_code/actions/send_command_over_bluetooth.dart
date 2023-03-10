// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:convert';

Future sendCommandOverBluetooth(
  String commandName,
  String? commandValue,
  String deviceID,
  String serviceID,
  String charactaristicID,
) async {
  // Add your function code here!
  BluetoothCharacteristic? characteristic =
      await getCharacteristicForConnectedDevice(
          deviceID, serviceID, charactaristicID);
  String strCommand = "${commandName}:${commandValue ?? 'none'}";
  List<int> bytesCommand = utf8.encode(strCommand);
  await characteristic?.write(bytesCommand, withoutResponse: false);
  await characteristic?.read();
}

Future<BluetoothCharacteristic?> getCharacteristicForConnectedDevice(
  String deviceID,
  String serviceID,
  String charactaristicID,
) async {
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
            return characteristic;
          }
        }
      }
    }
  });
}
