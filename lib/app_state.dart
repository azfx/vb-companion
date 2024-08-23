import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _homeWiFiSSID = prefs.getString('ff_homeWiFiSSID') ?? _homeWiFiSSID;
    });
    _safeInit(() {
      _homeWiFiPassword =
          prefs.getString('ff_homeWiFiPassword') ?? _homeWiFiPassword;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _brightness = 255;
  int get brightness => _brightness;
  set brightness(int value) {
    _brightness = value;
  }

  String _connectionState = '';
  String get connectionState => _connectionState;
  set connectionState(String value) {
    _connectionState = value;
  }

  String _connectedDeviceID = '';
  String get connectedDeviceID => _connectedDeviceID;
  set connectedDeviceID(String value) {
    _connectedDeviceID = value;
  }

  int _contrast = 255;
  int get contrast => _contrast;
  set contrast(int value) {
    _contrast = value;
  }

  int _rpLevel = 9;
  int get rpLevel => _rpLevel;
  set rpLevel(int value) {
    _rpLevel = value;
  }

  int _zoomLevel = 1;
  int get zoomLevel => _zoomLevel;
  set zoomLevel(int value) {
    _zoomLevel = value;
  }

  dynamic _currentSliderValue =
      jsonDecode('{\"brightness\":255,\"contrast\":255,\"zoomLevel\":1}');
  dynamic get currentSliderValue => _currentSliderValue;
  set currentSliderValue(dynamic value) {
    _currentSliderValue = value;
  }

  int _volume = 5;
  int get volume => _volume;
  set volume(int value) {
    _volume = value;
  }

  String _homeWiFiSSID = '';
  String get homeWiFiSSID => _homeWiFiSSID;
  set homeWiFiSSID(String value) {
    _homeWiFiSSID = value;
    prefs.setString('ff_homeWiFiSSID', value);
  }

  String _homeWiFiPassword = '';
  String get homeWiFiPassword => _homeWiFiPassword;
  set homeWiFiPassword(String value) {
    _homeWiFiPassword = value;
    prefs.setString('ff_homeWiFiPassword', value);
  }

  String _edids = '';
  String get edids => _edids;
  set edids(String value) {
    _edids = value;
  }

  List<String> _edidList = [];
  List<String> get edidList => _edidList;
  set edidList(List<String> value) {
    _edidList = value;
  }

  void addToEdidList(String value) {
    edidList.add(value);
  }

  void removeFromEdidList(String value) {
    edidList.remove(value);
  }

  void removeAtIndexFromEdidList(int index) {
    edidList.removeAt(index);
  }

  void updateEdidListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    edidList[index] = updateFn(_edidList[index]);
  }

  void insertAtIndexInEdidList(int index, String value) {
    edidList.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
