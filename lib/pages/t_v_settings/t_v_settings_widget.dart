import '/components/disconnected_state/disconnected_state_widget.dart';
import '/components/up_down_button/up_down_button_widget.dart';
import '/components/v_b_button_component/v_b_button_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 't_v_settings_model.dart';
export 't_v_settings_model.dart';

class TVSettingsWidget extends StatefulWidget {
  const TVSettingsWidget({Key? key}) : super(key: key);

  @override
  _TVSettingsWidgetState createState() => _TVSettingsWidgetState();
}

class _TVSettingsWidgetState extends State<TVSettingsWidget> {
  late TVSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TVSettingsModel());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          title: Text(
            'TV Settings',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.upDownButtonModel,
                    updateCallback: () => setState(() {}),
                    child: UpDownButtonWidget(
                      settingName: 'Zoom',
                      commandName: 'setZoom',
                      serviceID: '37200001-7638-4216-B629-96AD40F79BB1',
                      characteristicID: '47200008-7638-4216-B629-96AD40F79BB1',
                      maxSettingValue: 10,
                      minSettingValue: 1,
                      deltaValue: 1,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
                    child: Text(
                      'PICTURE SETTINGS',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: GridView(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.0,
                        ),
                        scrollDirection: Axis.vertical,
                        children: [
                          wrapWithModel(
                            model: _model.vBButtonComponentModel1,
                            updateCallback: () => setState(() {}),
                            child: VBButtonComponentWidget(
                              buttonIcon: Icon(
                                Icons.photo_size_select_actual_outlined,
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                              buttonText: 'STANDARD',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'SETPICTUREMODE',
                                  'STANDARD',
                                  FFAppState().connectedDeviceID,
                                  '37200001-7638-4216-B629-96AD40F79BB1',
                                  '47200008-7638-4216-B629-96AD40F79BB1',
                                );
                              },
                            ),
                          ),
                          wrapWithModel(
                            model: _model.vBButtonComponentModel2,
                            updateCallback: () => setState(() {}),
                            child: VBButtonComponentWidget(
                              buttonIcon: Icon(
                                Icons.photo_size_select_actual,
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                              buttonText: 'VIVID',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'SETPICTUREMODE',
                                  'VIVID',
                                  FFAppState().connectedDeviceID,
                                  '37200001-7638-4216-B629-96AD40F79BB1',
                                  '47200008-7638-4216-B629-96AD40F79BB1',
                                );
                              },
                            ),
                          ),
                          wrapWithModel(
                            model: _model.vBButtonComponentModel3,
                            updateCallback: () => setState(() {}),
                            child: VBButtonComponentWidget(
                              buttonIcon: Icon(
                                Icons.lightbulb_outlined,
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                              buttonText: 'BRIGHT',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'SETPICTUREMODE',
                                  'BRIGHT',
                                  FFAppState().connectedDeviceID,
                                  '37200001-7638-4216-B629-96AD40F79BB1',
                                  '47200008-7638-4216-B629-96AD40F79BB1',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await actions.sendCommandOverBluetooth(
                          'connectToTransmitter',
                          'none',
                          FFAppState().connectedDeviceID,
                          '37200001-7638-4216-B629-96AD40F79BB1',
                          '47200008-7638-4216-B629-96AD40F79BB1',
                        );
                      },
                      text: 'Connect To  Streamer',
                      icon: Icon(
                        Icons.wifi_sharp,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 250.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nunito',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await actions.sendCommandOverBluetooth(
                          'checkTransmitterConnection',
                          'none',
                          FFAppState().connectedDeviceID,
                          '37200001-7638-4216-B629-96AD40F79BB1',
                          '47200008-7638-4216-B629-96AD40F79BB1',
                        );
                      },
                      text: 'Check Connection',
                      icon: Icon(
                        Icons.help_center_outlined,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 250.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nunito',
                                  color: Colors.white,
                                ),
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
              wrapWithModel(
                model: _model.disconnectedStateModel,
                updateCallback: () => setState(() {}),
                child: DisconnectedStateWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
