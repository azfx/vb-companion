import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _brightness = 255;
  int get brightness => _brightness;
  set brightness(int _value) {
    _brightness = _value;
  }

  String _connectionState = '';
  String get connectionState => _connectionState;
  set connectionState(String _value) {
    _connectionState = _value;
  }

  String _connectedDeviceID = '';
  String get connectedDeviceID => _connectedDeviceID;
  set connectedDeviceID(String _value) {
    _connectedDeviceID = _value;
  }

  int _contrast = 255;
  int get contrast => _contrast;
  set contrast(int _value) {
    _contrast = _value;
  }

  int _rpLevel = 9;
  int get rpLevel => _rpLevel;
  set rpLevel(int _value) {
    _rpLevel = _value;
  }

  int _zoomLevel = 1;
  int get zoomLevel => _zoomLevel;
  set zoomLevel(int _value) {
    _zoomLevel = _value;
  }

  dynamic _currentSliderValue =
      jsonDecode('{\"brightness\":255,\"contrast\":255,\"zoomLevel\":1}');
  dynamic get currentSliderValue => _currentSliderValue;
  set currentSliderValue(dynamic _value) {
    _currentSliderValue = _value;
  }

  int _volume = 5;
  int get volume => _volume;
  set volume(int _value) {
    _volume = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
