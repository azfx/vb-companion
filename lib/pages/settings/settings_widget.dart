import '/components/disconnected_state/disconnected_state_widget.dart';
import '/components/v_b_button_component/v_b_button_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

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
          automaticallyImplyLeading: false,
          title: Text(
            'MODES',
            style: FlutterFlowTheme.of(context).titleMedium,
          ),
          actions: [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
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
                          InkWell(
                            onTap: () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 1000));

                              context.pushNamed('Magnification');
                            },
                            child: wrapWithModel(
                              model: _model.vBButtonComponentModel1,
                              updateCallback: () => setState(() {}),
                              child: VBButtonComponentWidget(
                                buttonIcon: Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 30.0,
                                ),
                                buttonText: 'Magnification',
                                onButtonTap: () async {
                                  await actions.sendCommandOverBluetooth(
                                    'switchMode',
                                    'MAGNIFICATION',
                                    FFAppState().connectedDeviceID,
                                    '37200001-7638-4216-B629-96AD40F79BB1',
                                    '47200008-7638-4216-B629-96AD40F79BB1',
                                  );

                                  context.pushNamed('Magnification');
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 1000));

                              context.pushNamed('Magnification');
                            },
                            child: wrapWithModel(
                              model: _model.vBButtonComponentModel2,
                              updateCallback: () => setState(() {}),
                              child: VBButtonComponentWidget(
                                buttonIcon: Icon(
                                  Icons.live_tv,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 30.0,
                                ),
                                buttonText: 'TV Mode',
                                onButtonTap: () async {
                                  await actions.sendCommandOverBluetooth(
                                    'switchMode',
                                    'TELEVISION',
                                    FFAppState().connectedDeviceID,
                                    '37200001-7638-4216-B629-96AD40F79BB1',
                                    '47200008-7638-4216-B629-96AD40F79BB1',
                                  );

                                  context.pushNamed('TVSettings');
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 1000));

                              context.pushNamed('Magnification');
                            },
                            child: wrapWithModel(
                              model: _model.vBButtonComponentModel3,
                              updateCallback: () => setState(() {}),
                              child: VBButtonComponentWidget(
                                buttonIcon: Icon(
                                  Icons.fitness_center_sharp,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 30.0,
                                ),
                                buttonText: 'Fitness Mode',
                                onButtonTap: () async {
                                  context.pushNamed('FittnessSettings');
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 1000));

                              context.pushNamed('Magnification');
                            },
                            child: wrapWithModel(
                              model: _model.vBButtonComponentModel4,
                              updateCallback: () => setState(() {}),
                              child: VBButtonComponentWidget(
                                buttonIcon: Icon(
                                  Icons.border_outer,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 30.0,
                                ),
                                buttonText: 'RP Mode',
                                onButtonTap: () async {
                                  context.pushNamed('RPSettings');
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 1000));

                              context.pushNamed('Magnification');
                            },
                            child: wrapWithModel(
                              model: _model.vBButtonComponentModel5,
                              updateCallback: () => setState(() {}),
                              child: VBButtonComponentWidget(
                                buttonIcon: Icon(
                                  Icons.settings_outlined,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 30.0,
                                ),
                                buttonText: 'General',
                                onButtonTap: () async {
                                  context.pushNamed('GeneralSettings');
                                },
                              ),
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
