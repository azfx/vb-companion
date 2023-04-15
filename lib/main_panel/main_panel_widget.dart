import '/components/up_down_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_panel_model.dart';
export 'main_panel_model.dart';

class MainPanelWidget extends StatefulWidget {
  const MainPanelWidget({
    Key? key,
    this.deviceID,
  }) : super(key: key);

  final String? deviceID;

  @override
  _MainPanelWidgetState createState() => _MainPanelWidgetState();
}

class _MainPanelWidgetState extends State<MainPanelWidget> {
  late MainPanelModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPanelModel());

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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Stack(
                  children: [
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
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Text(
                                  'Please ensure the headset is powered on, and in bluetooth scan mode.',
                                  textAlign: TextAlign.center,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
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
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 500.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'MAIN SETTINGS',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: wrapWithModel(
                                        model: _model.upDownButtonModel1,
                                        updateCallback: () => setState(() {}),
                                        child: UpDownButtonWidget(
                                          settingName: 'Brightness',
                                          commandName: 'setBrightness',
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
                                        model: _model.upDownButtonModel2,
                                        updateCallback: () => setState(() {}),
                                        child: UpDownButtonWidget(
                                          settingName: 'Contrast',
                                          commandName: 'setContrast',
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
                                        model: _model.upDownButtonModel3,
                                        updateCallback: () => setState(() {}),
                                        child: UpDownButtonWidget(
                                          settingName: 'Zoom',
                                          commandName: 'setZoom',
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
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
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
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
