import '/components/disconnected_state/disconnected_state_widget.dart';
import '/components/up_down_button/up_down_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_panel_model.dart';
export 'main_panel_model.dart';

class MainPanelWidget extends StatefulWidget {
  const MainPanelWidget({
    super.key,
    this.deviceID,
  });

  final String? deviceID;

  @override
  State<MainPanelWidget> createState() => _MainPanelWidgetState();
}

class _MainPanelWidgetState extends State<MainPanelWidget> {
  late MainPanelModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPanelModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.initializeDevice(
        FFAppState().connectedDeviceID,
      );
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Image.asset(
            'assets/images/VB-Logo-White-No-Text.png',
            width: 100.0,
            height: 58.8,
            fit: BoxFit.contain,
          ),
          actions: [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 440.0,
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 440.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                              '47200008-7638-4216-B629-96AD40F79BB1',
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
                                          settingName: 'Volume',
                                          commandName: 'setVolume',
                                          serviceID:
                                              '37200001-7638-4216-B629-96AD40F79BB1',
                                          characteristicID:
                                              '47200008-7638-4216-B629-96AD40F79BB1',
                                          maxSettingValue: 15,
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
                                              '47200008-7638-4216-B629-96AD40F79BB1',
                                          maxSettingValue: 10,
                                          minSettingValue: 1,
                                          deltaValue: 1,
                                          defaultValue: 1,
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
                                  text: 'Next Mode',
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'v1.0.1.1',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    wrapWithModel(
                      model: _model.disconnectedStateModel,
                      updateCallback: () => setState(() {}),
                      child: DisconnectedStateWidget(),
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
