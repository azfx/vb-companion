import '/components/disconnected_state/disconnected_state_widget.dart';
import '/components/v_b_button_component/v_b_button_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'camera_picture_modes_model.dart';
export 'camera_picture_modes_model.dart';

class CameraPictureModesWidget extends StatefulWidget {
  const CameraPictureModesWidget({super.key});

  @override
  State<CameraPictureModesWidget> createState() =>
      _CameraPictureModesWidgetState();
}

class _CameraPictureModesWidgetState extends State<CameraPictureModesWidget> {
  late CameraPictureModesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraPictureModesModel());

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
            'CAMERA MODES',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Nunito',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: GridView(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: 1.5,
                        ),
                        scrollDirection: Axis.vertical,
                        children: [
                          wrapWithModel(
                            model: _model.vBButtonComponentModel1,
                            updateCallback: () => setState(() {}),
                            child: VBButtonComponentWidget(
                              buttonIcon: Icon(
                                Icons.sensor_occupied,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Standard',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'CAMERAMODE',
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
                                Icons.sensor_occupied,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Vivid',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'CAMERAMODE',
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
                                Icons.sensor_occupied,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'High Contrast',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'CAMERAMODE',
                                  'HIGHCONTRAST',
                                  FFAppState().connectedDeviceID,
                                  '37200001-7638-4216-B629-96AD40F79BB1',
                                  '47200008-7638-4216-B629-96AD40F79BB1',
                                );
                              },
                            ),
                          ),
                          wrapWithModel(
                            model: _model.vBButtonComponentModel4,
                            updateCallback: () => setState(() {}),
                            child: VBButtonComponentWidget(
                              buttonIcon: Icon(
                                Icons.sensor_occupied,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Bright',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'CAMERAMODE',
                                  'BRIGHT',
                                  FFAppState().connectedDeviceID,
                                  '37200001-7638-4216-B629-96AD40F79BB1',
                                  '47200008-7638-4216-B629-96AD40F79BB1',
                                );
                              },
                            ),
                          ),
                          wrapWithModel(
                            model: _model.vBButtonComponentModel5,
                            updateCallback: () => setState(() {}),
                            child: VBButtonComponentWidget(
                              buttonIcon: Icon(
                                Icons.toggle_off_outlined,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Outline OFF',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'OUTLINEMODE',
                                  'OFF',
                                  FFAppState().connectedDeviceID,
                                  '37200001-7638-4216-B629-96AD40F79BB1',
                                  '47200008-7638-4216-B629-96AD40F79BB1',
                                );
                              },
                            ),
                          ),
                          wrapWithModel(
                            model: _model.vBButtonComponentModel6,
                            updateCallback: () => setState(() {}),
                            child: VBButtonComponentWidget(
                              buttonIcon: Icon(
                                Icons.toggle_on_outlined,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Outline ON',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'OUTLINEMODE',
                                  'ON',
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
