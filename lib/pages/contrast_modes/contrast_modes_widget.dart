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
import 'contrast_modes_model.dart';
export 'contrast_modes_model.dart';

class ContrastModesWidget extends StatefulWidget {
  const ContrastModesWidget({super.key});

  @override
  State<ContrastModesWidget> createState() => _ContrastModesWidgetState();
}

class _ContrastModesWidgetState extends State<ContrastModesWidget> {
  late ContrastModesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContrastModesModel());

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
            'CONTRASTS',
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
                                Icons.lens_blur_rounded,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Grey',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'CONTRASTFILTER',
                                  'GREY',
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
                                Icons.lens_blur_sharp,
                                color: FlutterFlowTheme.of(context).accent1,
                                size: 30.0,
                              ),
                              buttonText: 'Inverted Grey',
                              foregroundColor:
                                  FlutterFlowTheme.of(context).accent1,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent3,
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'CONTRASTFILTER',
                                  'INVERTEDGREY',
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
                                Icons.lens_blur_sharp,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 30.0,
                              ),
                              buttonText: 'Yellow on Black',
                              foregroundColor:
                                  FlutterFlowTheme.of(context).tertiary,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'CONTRASTFILTER',
                                  'YELLOWONBLACK',
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
                                Icons.lens_blur_sharp,
                                color: FlutterFlowTheme.of(context).success,
                                size: 30.0,
                              ),
                              buttonText: 'Green on Black',
                              foregroundColor:
                                  FlutterFlowTheme.of(context).success,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'CONTRASTFILTER',
                                  'GREENONBLACK',
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
                                Icons.lens_blur_sharp,
                                color: FlutterFlowTheme.of(context).error,
                                size: 30.0,
                              ),
                              buttonText: 'Red on Black',
                              foregroundColor:
                                  FlutterFlowTheme.of(context).error,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'CONTRASTFILTER',
                                  'REDONBLACK',
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
                                Icons.lens_blur_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              buttonText: 'B/W',
                              foregroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'CONTRASTFILTER',
                                  'BW',
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
