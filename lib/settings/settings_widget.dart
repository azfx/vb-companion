import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({
    Key? key,
    this.deviceID,
  }) : super(key: key);

  final String? deviceID;

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.initializeDevice(
        widget.deviceID!,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00E0E3E7),
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        border: Border.all(
                                          color: Color(0x50E0E3E7),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Brightness',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                            Container(
                                              width: 200.0,
                                              height: 40.0,
                                              child: custom_widgets
                                                  .BlueToothDeviceSlider(
                                                width: 200.0,
                                                height: 40.0,
                                                displayName: 'Brightness',
                                                value: FFAppState()
                                                    .brightness
                                                    .toDouble(),
                                                min: 128.0,
                                                max: 255.0,
                                                deviceID: FFAppState()
                                                    .connectedDeviceID,
                                                serviceID:
                                                    '37200001-7638-4216-B629-96AD40F79BB1',
                                                charactaristicID:
                                                    '47200001-7638-4216-B629-96AD40F79BB1',
                                                fieldName: 'brightness',
                                                onChanged: () async {
                                                  setState(() {
                                                    FFAppState().brightness =
                                                        getJsonField(
                                                      FFAppState()
                                                          .currentSliderValue,
                                                      r'''$.brightness''',
                                                    );
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00E0E3E7),
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        border: Border.all(
                                          color: Color(0x50E0E3E7),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Contrast',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                            Container(
                                              width: 200.0,
                                              height: 40.0,
                                              child: custom_widgets
                                                  .BlueToothDeviceSlider(
                                                width: 200.0,
                                                height: 40.0,
                                                displayName: 'Contrast',
                                                value: FFAppState()
                                                    .contrast
                                                    .toDouble(),
                                                min: 128.0,
                                                max: 255.0,
                                                deviceID: FFAppState()
                                                    .connectedDeviceID,
                                                serviceID:
                                                    '37200001-7638-4216-B629-96AD40F79BB1',
                                                charactaristicID:
                                                    '47200002-7638-4216-B629-96AD40F79BB1',
                                                fieldName: 'contrast',
                                                onChanged: () async {
                                                  setState(() {
                                                    FFAppState().contrast =
                                                        getJsonField(
                                                      FFAppState()
                                                          .currentSliderValue,
                                                      r'''$.contrast''',
                                                    );
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00E0E3E7),
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        border: Border.all(
                                          color: Color(0x50E0E3E7),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'RP Window Size',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                            Container(
                                              width: 200.0,
                                              height: 40.0,
                                              child: custom_widgets
                                                  .BlueToothDeviceSlider(
                                                width: 200.0,
                                                height: 40.0,
                                                displayName: 'RP',
                                                value: FFAppState()
                                                    .rpLevel
                                                    .toDouble(),
                                                min: 128.0,
                                                max: 255.0,
                                                deviceID: FFAppState()
                                                    .connectedDeviceID,
                                                serviceID:
                                                    '37200001-7638-4216-B629-96AD40F79BB1',
                                                charactaristicID:
                                                    '47200005-7638-4216-B629-96AD40F79BB1',
                                                fieldName: 'rpLevel',
                                                onChanged: () async {
                                                  setState(() {
                                                    FFAppState().rpLevel =
                                                        getJsonField(
                                                      FFAppState()
                                                          .currentSliderValue,
                                                      r'''$.rpLevel''',
                                                    );
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00E0E3E7),
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        border: Border.all(
                                          color: Color(0x50E0E3E7),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Volume',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                            Container(
                                              width: 200.0,
                                              height: 40.0,
                                              child: custom_widgets
                                                  .BlueToothDeviceSlider(
                                                width: 200.0,
                                                height: 40.0,
                                                displayName: 'Volume',
                                                value: FFAppState()
                                                    .volume
                                                    .toDouble(),
                                                min: 0.0,
                                                max: 7.0,
                                                deviceID: FFAppState()
                                                    .connectedDeviceID,
                                                serviceID:
                                                    '37200001-7638-4216-B629-96AD40F79BB1',
                                                charactaristicID:
                                                    '47200007-7638-4216-B629-96AD40F79BB1',
                                                fieldName: 'volume',
                                                onChanged: () async {
                                                  setState(() {
                                                    FFAppState().volume =
                                                        getJsonField(
                                                      FFAppState()
                                                          .currentSliderValue,
                                                      r'''$.volume''',
                                                    );
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 310.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        border: Border.all(
                                          color: Color(0x50E0E3E7),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            height: 300.0,
                                            child: custom_widgets
                                                .BlueToothDeviceVerticalSlider(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              height: 300.0,
                                              characteristicID:
                                                  '47200004-7638-4216-B629-96AD40F79BB1',
                                            ),
                                          ),
                                          Text(
                                            'Zoom',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Mode',
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (FFAppState().connectionState == 'disconnected')
                      Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 25.0, 25.0, 25.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Icon(
                                  Icons.error_outline,
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  size: 60.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Text(
                                  'Vision Buddy Headset disconnected!',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Text(
                                  'Please ensure the headset is powered on, and in bluetooth scan mode.',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed(
                                    'HomePage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                text: 'Retry',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
