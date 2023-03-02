// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

//import '../../';

//import '../flutter_flow/flutter_flow_widgets.dart';

class VBPanel extends StatefulWidget {
  const VBPanel({
    Key? key,
    this.width,
    this.height,
    required this.deviceID,
    required this.serviceID,
    required this.brightnessID,
    required this.rpLevelID,
    required this.zoomLevelID,
    required this.contrastID,
    required this.volumeLevelID,
    required this.modeID,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String deviceID;
  final String serviceID;
  final String brightnessID;
  final String rpLevelID;
  final String zoomLevelID;
  final String contrastID;
  final String volumeLevelID;
  final String modeID;

  @override
  _VBPanelState createState() => _VBPanelState();
}

class _VBPanelState extends State<VBPanel> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                            child: Text(
                              valueOrDefault<String>(
                                FFAppState().brightness.toString(),
                                '255',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 50,
                              child: BlueToothDeviceSlider(
                                  displayName: 'Brightness',
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 50,
                                  deviceID: widget.deviceID!,
                                  min: 128.0,
                                  max: 255.0,
                                  value: FFAppState().brightness,
                                  serviceID: widget.serviceID,
                                  charactaristicID: widget.brightnessID,
                                  onChanged: (dynamic newValue) {
                                    FFAppState().update(() => FFAppState()
                                        .brightness = newValue.toInt());
                                  }),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 50,
                              child: BlueToothDeviceSlider(
                                  displayName: 'Contrast',
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 50,
                                  deviceID: widget.deviceID!,
                                  min: 128.0,
                                  max: 255.0,
                                  value: FFAppState().contrast,
                                  serviceID: widget.serviceID,
                                  charactaristicID: widget.contrastID,
                                  onChanged: (dynamic newValue) {
                                    FFAppState().update(() => FFAppState()
                                        .contrast = newValue.toInt());
                                  }),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 50,
                              child: BlueToothDeviceSlider(
                                  displayName: 'RP Level',
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 50,
                                  deviceID: widget.deviceID!,
                                  min: 0.0,
                                  max: 9.0,
                                  value: FFAppState().rpLevel,
                                  serviceID: widget.serviceID,
                                  charactaristicID: widget.rpLevelID,
                                  onChanged: (dynamic newValue) {
                                    FFAppState().update(() => FFAppState()
                                        .rpLevel = newValue.toInt());
                                  }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: 50,
                      height: 300,
                      child: BlueToothDeviceVerticalSlider(
                        width: 50,
                        height: 300,
                        characteristicID: '23234',
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

T valueOrDefault<T>(T? value, T defaultValue) =>
    (value is String && value.isEmpty) || value == null ? defaultValue : value;
