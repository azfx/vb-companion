import '/components/disconnected_state/disconnected_state_widget.dart';
import '/components/v_b_button_component/v_b_button_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fittness_settings_model.dart';
export 'fittness_settings_model.dart';

class FittnessSettingsWidget extends StatefulWidget {
  const FittnessSettingsWidget({Key? key}) : super(key: key);

  @override
  _FittnessSettingsWidgetState createState() => _FittnessSettingsWidgetState();
}

class _FittnessSettingsWidgetState extends State<FittnessSettingsWidget> {
  late FittnessSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FittnessSettingsModel());

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
            'Buddy',
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        border: Border.all(
                          color: Color(0xFF363A3F),
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Watch Fitness Videos',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
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
                                Icons.ondemand_video_rounded,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Daily Yoga',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'playVideo',
                                  'dailyyoga',
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
                                Icons.ondemand_video_rounded,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Nature Walk',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'playVideo',
                                  'naturewalk',
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
                                Icons.ondemand_video_rounded,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Mobility',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'playVideo',
                                  'mobility',
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
                                Icons.ondemand_video_rounded,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'TV',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'playVideo',
                                  'TV',
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
