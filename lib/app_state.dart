import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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
