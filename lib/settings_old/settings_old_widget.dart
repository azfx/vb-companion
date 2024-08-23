import '/components/up_down_button/up_down_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_old_model.dart';
export 'settings_old_model.dart';

class SettingsOldWidget extends StatefulWidget {
  const SettingsOldWidget({
    super.key,
    this.deviceID,
  });

  final String? deviceID;

  @override
  State<SettingsOldWidget> createState() => _SettingsOldWidgetState();
}

class _SettingsOldWidgetState extends State<SettingsOldWidget>
    with TickerProviderStateMixin {
  late SettingsOldModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsOldModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.initializeDevice(
        widget!.deviceID!,
      );
    });

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.8,
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
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 500.0,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 50.0),
                                    child: PageView(
                                      controller: _model.pageViewController ??=
                                          PageController(initialPage: 0),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.6,
                                                    height: 85.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0x50E0E3E7),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  5.0,
                                                                  10.0,
                                                                  5.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Brightness',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),

                                                          // 1. The widget code updates the json object sliderValues
                                                          // 2. onChanged parameter in the UI gets the value of the slider and updates the curresponding app state. In this particular widget instance, it is Brightness.
                                                          Container(
                                                            width: 200.0,
                                                            height: 45.0,
                                                            child: custom_widgets
                                                                .BlueToothDeviceSlider(
                                                              width: 200.0,
                                                              height: 45.0,
                                                              displayName:
                                                                  'Brightness',
                                                              value: FFAppState()
                                                                  .brightness
                                                                  .toDouble(),
                                                              min: 1.0,
                                                              max: 10.0,
                                                              deviceID: FFAppState()
                                                                  .connectedDeviceID,
                                                              serviceID:
                                                                  '37200001-7638-4216-B629-96AD40F79BB1',
                                                              charactaristicID:
                                                                  '47200001-7638-4216-B629-96AD40F79BB1',
                                                              fieldName:
                                                                  'brightness',
                                                              showLabels: true,
                                                              showTicks: false,
                                                              enableTooltip:
                                                                  true,
                                                              interval: 25,
                                                              minorTicksPerInterval:
                                                                  1,
                                                              onChanged:
                                                                  () async {
                                                                FFAppState()
                                                                        .brightness =
                                                                    getJsonField(
                                                                  FFAppState()
                                                                      .currentSliderValue,
                                                                  r'''$.brightness''',
                                                                );
                                                                setState(() {});
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.6,
                                                    height: 85.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00E0E3E7),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0x50E0E3E7),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  5.0,
                                                                  10.0,
                                                                  5.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Contrast',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Container(
                                                            width: 200.0,
                                                            height: 45.0,
                                                            child: custom_widgets
                                                                .BlueToothDeviceSlider(
                                                              width: 200.0,
                                                              height: 45.0,
                                                              displayName:
                                                                  'Contrast',
                                                              value: FFAppState()
                                                                  .contrast
                                                                  .toDouble(),
                                                              min: 1.0,
                                                              max: 10.0,
                                                              deviceID: FFAppState()
                                                                  .connectedDeviceID,
                                                              serviceID:
                                                                  '37200001-7638-4216-B629-96AD40F79BB1',
                                                              charactaristicID:
                                                                  '47200002-7638-4216-B629-96AD40F79BB1',
                                                              fieldName:
                                                                  'contrast',
                                                              showLabels: false,
                                                              showTicks: false,
                                                              enableTooltip:
                                                                  false,
                                                              interval: 1,
                                                              minorTicksPerInterval:
                                                                  1,
                                                              onChanged:
                                                                  () async {
                                                                FFAppState()
                                                                        .contrast =
                                                                    getJsonField(
                                                                  FFAppState()
                                                                      .currentSliderValue,
                                                                  r'''$.contrast''',
                                                                );
                                                                setState(() {});
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.6,
                                                    height: 85.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00E0E3E7),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0x50E0E3E7),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  5.0,
                                                                  10.0,
                                                                  5.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'RP Window Size',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Container(
                                                            width: 200.0,
                                                            height: 45.0,
                                                            child: custom_widgets
                                                                .BlueToothDeviceSlider(
                                                              width: 200.0,
                                                              height: 45.0,
                                                              displayName: 'RP',
                                                              value: FFAppState()
                                                                  .rpLevel
                                                                  .toDouble(),
                                                              min: 1.0,
                                                              max: 10.0,
                                                              deviceID: FFAppState()
                                                                  .connectedDeviceID,
                                                              serviceID:
                                                                  '37200001-7638-4216-B629-96AD40F79BB1',
                                                              charactaristicID:
                                                                  '47200005-7638-4216-B629-96AD40F79BB1',
                                                              fieldName:
                                                                  'rpLevel',
                                                              showLabels: true,
                                                              showTicks: false,
                                                              enableTooltip:
                                                                  true,
                                                              interval: 1,
                                                              minorTicksPerInterval:
                                                                  1,
                                                              onChanged:
                                                                  () async {
                                                                FFAppState()
                                                                        .rpLevel =
                                                                    getJsonField(
                                                                  FFAppState()
                                                                      .currentSliderValue,
                                                                  r'''$.rpLevel''',
                                                                );
                                                                setState(() {});
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.6,
                                                    height: 85.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00E0E3E7),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0x50E0E3E7),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  5.0,
                                                                  10.0,
                                                                  5.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Volume',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Container(
                                                            width: 200.0,
                                                            height: 45.0,
                                                            child: custom_widgets
                                                                .BlueToothDeviceSlider(
                                                              width: 200.0,
                                                              height: 45.0,
                                                              displayName:
                                                                  'Volume',
                                                              value: FFAppState()
                                                                  .volume
                                                                  .toDouble(),
                                                              min: 1.0,
                                                              max: 10.0,
                                                              deviceID: FFAppState()
                                                                  .connectedDeviceID,
                                                              serviceID:
                                                                  '37200001-7638-4216-B629-96AD40F79BB1',
                                                              charactaristicID:
                                                                  '47200007-7638-4216-B629-96AD40F79BB1',
                                                              fieldName:
                                                                  'volume',
                                                              showLabels: true,
                                                              showTicks: false,
                                                              enableTooltip:
                                                                  true,
                                                              interval: 1,
                                                              minorTicksPerInterval:
                                                                  1,
                                                              onChanged:
                                                                  () async {
                                                                FFAppState()
                                                                        .volume =
                                                                    getJsonField(
                                                                  FFAppState()
                                                                      .currentSliderValue,
                                                                  r'''$.volume''',
                                                                );
                                                                setState(() {});
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 100.0,
                                                    height: 450.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0x50E0E3E7),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.2,
                                                          height: 400.0,
                                                          child: custom_widgets
                                                              .BlueToothDeviceVerticalSlider(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.2,
                                                            height: 400.0,
                                                            displayName: 'Zoom',
                                                            fieldName:
                                                                'zoomLevel',
                                                            value: FFAppState()
                                                                .zoomLevel
                                                                .toDouble(),
                                                            min: 1.0,
                                                            max: 10.0,
                                                            deviceID: FFAppState()
                                                                .connectedDeviceID,
                                                            serviceID:
                                                                '37200001-7638-4216-B629-96AD40F79BB1',
                                                            charactaristicID:
                                                                '47200004-7638-4216-B629-96AD40F79BB1',
                                                            showLabels: true,
                                                            showTicks: true,
                                                            enableTooltip: true,
                                                            interval: 1,
                                                            minorTicksPerInterval:
                                                                1,
                                                            onChanged:
                                                                () async {
                                                              FFAppState()
                                                                      .zoomLevel =
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .currentSliderValue,
                                                                r'''$.zoomLevel''',
                                                              );
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Zoom',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'MAIN SETTINGS',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .upDownButtonModel1,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            UpDownButtonWidget(
                                                          settingName:
                                                              'Brightness',
                                                          commandName:
                                                              'setBrightness',
                                                          serviceID:
                                                              '37200001-7638-4216-B629-96AD40F79BB1',
                                                          characteristicID:
                                                              '47200001-7638-4216-B629-96AD40F79BB1',
                                                          maxSettingValue: 10,
                                                          minSettingValue: 1,
                                                          deltaValue: 1,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .upDownButtonModel2,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            UpDownButtonWidget(
                                                          settingName:
                                                              'Contrast',
                                                          commandName:
                                                              'setContrast',
                                                          serviceID:
                                                              '37200001-7638-4216-B629-96AD40F79BB1',
                                                          characteristicID:
                                                              '47200002-7638-4216-B629-96AD40F79BB1',
                                                          maxSettingValue: 10,
                                                          minSettingValue: 1,
                                                          deltaValue: 1,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .upDownButtonModel3,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            UpDownButtonWidget(
                                                          settingName: 'Zoom',
                                                          commandName:
                                                              'setZoom',
                                                          serviceID:
                                                              '37200001-7638-4216-B629-96AD40F79BB1',
                                                          characteristicID:
                                                              '47200004-7638-4216-B629-96AD40F79BB1',
                                                          maxSettingValue: 10,
                                                          minSettingValue: 1,
                                                          deltaValue: 1,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Image.network(
                                          'https://picsum.photos/seed/152/600',
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller:
                                            _model.pageViewController ??=
                                                PageController(initialPage: 0),
                                        count: 3,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) async {
                                          await _model.pageViewController!
                                              .animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                          setState(() {});
                                        },
                                        effect: smooth_page_indicator
                                            .ExpandingDotsEffect(
                                          expansionFactor: 2.0,
                                          spacing: 8.0,
                                          radius: 16.0,
                                          dotWidth: 16.0,
                                          dotHeight: 16.0,
                                          dotColor: FlutterFlowTheme.of(context)
                                              .accent2,
                                          activeDotColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          paintStyle: PaintingStyle.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await actions.sendCommandOverBluetooth(
                                  'nextMode',
                                  '',
                                  FFAppState().connectedDeviceID,
                                  '37200001-7638-4216-B629-96AD40F79BB1',
                                  '47200008-7638-4216-B629-96AD40F79BB1',
                                );
                              },
                              text: 'Mode',
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await actions.sendCommandOverBluetooth(
                                  'nextMode',
                                  '',
                                  FFAppState().connectedDeviceID,
                                  '37200001-7638-4216-B629-96AD40F79BB1',
                                  '47200008-7638-4216-B629-96AD40F79BB1',
                                );
                              },
                              text: 'Settings',
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF363A3F),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).secondary,
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
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.8,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Icon(
                                  Icons.error_outline,
                                  color: FlutterFlowTheme.of(context).tertiary,
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
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Text(
                                  'Please ensure the headset is powered on, and in bluetooth scan mode.',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito',
                                        letterSpacing: 0.0,
                                      ),
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
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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
              ).animateOnPageLoad(animationsMap['stackOnPageLoadAnimation']!),
            ],
          ),
        ),
      ),
    );
  }
}
