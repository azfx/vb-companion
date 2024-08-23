import '/components/disconnected_state/disconnected_state_widget.dart';
import '/components/v_b_button_component/v_b_button_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_settings_model.dart';
export 'admin_settings_model.dart';

class AdminSettingsWidget extends StatefulWidget {
  const AdminSettingsWidget({
    super.key,
    required this.pin,
    bool? switchButton,
  }) : this.switchButton = switchButton ?? true;

  final String? pin;
  final bool switchButton;

  @override
  State<AdminSettingsWidget> createState() => _AdminSettingsWidgetState();
}

class _AdminSettingsWidgetState extends State<AdminSettingsWidget> {
  late AdminSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminSettingsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.pin != '94588123.') {
        context.safePop();
      }
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
          automaticallyImplyLeading: true,
          title: Text(
            'ADMIN',
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
                                Icons.wifi,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Set Home WiFi',
                              onButtonTap: () async {
                                context.pushNamed('SetupWifi');
                              },
                            ),
                          ),
                          wrapWithModel(
                            model: _model.vBButtonComponentModel2,
                            updateCallback: () => setState(() {}),
                            child: VBButtonComponentWidget(
                              buttonIcon: Icon(
                                Icons.wifi_off,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Clear Home Wifi',
                              onButtonTap: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Clear Home WiFi'),
                                              content: Text(
                                                  'Are you sure you want to clear home wifi setting from the headset?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('No'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Yes'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  await actions.sendCommandOverBluetooth(
                                    'CLEARHOMEWIFI',
                                    'none',
                                    FFAppState().connectedDeviceID,
                                    '37200001-7638-4216-B629-96AD40F79BB1',
                                    '47200008-7638-4216-B629-96AD40F79BB1',
                                  );
                                }
                              },
                            ),
                          ),
                          wrapWithModel(
                            model: _model.vBButtonComponentModel3,
                            updateCallback: () => setState(() {}),
                            child: VBButtonComponentWidget(
                              buttonIcon: Icon(
                                Icons.toggle_on_outlined,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Enable Reading Mode',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'ENABLEMODE',
                                  'READING',
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
                                Icons.toggle_off_outlined,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Disable Reading Mode',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'DISABLEMODE',
                                  'READING',
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
                                Icons.toggle_on_outlined,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Enable Magnification Mode',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'ENABLEMODE',
                                  'MAGNIFICATION',
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
                                Icons.toggle_off_outlined,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Disable Magnification Mode',
                              onButtonTap: () async {
                                await actions.sendCommandOverBluetooth(
                                  'DISABLEMODE',
                                  'MAGNIFICATION',
                                  FFAppState().connectedDeviceID,
                                  '37200001-7638-4216-B629-96AD40F79BB1',
                                  '47200008-7638-4216-B629-96AD40F79BB1',
                                );
                              },
                            ),
                          ),
                          wrapWithModel(
                            model: _model.vBButtonComponentModel7,
                            updateCallback: () => setState(() {}),
                            child: VBButtonComponentWidget(
                              buttonIcon: Icon(
                                Icons.aspect_ratio,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 30.0,
                              ),
                              buttonText: 'Set EDID',
                              onButtonTap: () async {
                                context.pushNamed('EDIDSettings');
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
