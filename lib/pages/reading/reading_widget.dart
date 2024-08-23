import '/components/disconnected_state/disconnected_state_widget.dart';
import '/components/up_down_button/up_down_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reading_model.dart';
export 'reading_model.dart';

class ReadingWidget extends StatefulWidget {
  const ReadingWidget({super.key});

  @override
  State<ReadingWidget> createState() => _ReadingWidgetState();
}

class _ReadingWidgetState extends State<ReadingWidget> {
  late ReadingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReadingModel());

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
          automaticallyImplyLeading: true,
          title: Text(
            'Reading',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
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
                              commandName: 'setCameraBrightness',
                              serviceID: '37200001-7638-4216-B629-96AD40F79BB1',
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
                              settingName: 'Contrast',
                              commandName: 'setContrast',
                              serviceID: '37200001-7638-4216-B629-96AD40F79BB1',
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
                            model: _model.upDownButtonModel3,
                            updateCallback: () => setState(() {}),
                            child: UpDownButtonWidget(
                              settingName: 'Saturation',
                              commandName: 'setSaturation',
                              serviceID: '37200001-7638-4216-B629-96AD40F79BB1',
                              characteristicID:
                                  '47200008-7638-4216-B629-96AD40F79BB1',
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('ContrastModes');
                      },
                      text: 'Contrast Modes',
                      options: FFButtonOptions(
                        width: 200.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nunito',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await actions.sendCommandOverBluetooth(
                          'RESET',
                          'READING',
                          FFAppState().connectedDeviceID,
                          '37200001-7638-4216-B629-96AD40F79BB1',
                          '47200008-7638-4216-B629-96AD40F79BB1',
                        );
                      },
                      text: 'Reset Mode',
                      options: FFButtonOptions(
                        width: 130.0,
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
