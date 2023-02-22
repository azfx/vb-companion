import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.turnOnBlueTooth();
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                (String varConnState) {
                  return varConnState.contains("CONNECTED")
                      ? "CONNECTED"
                      : varConnState;
                }(_model.connectionState!),
                style: FlutterFlowTheme.of(context).subtitle1.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Image.asset(
                  'assets/images/VB-Logo-White-No-Text.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  _model.connectionState = 'Connecting..';
                  await Future.delayed(const Duration(milliseconds: 500));
                  _model.connectToVBBlueToothResult =
                      await actions.connectToVBBlueTooth();
                  _model.connectionState = _model.connectToVBBlueToothResult;
                  if ((String varConnState) {
                    return varConnState.contains("CONNECTED");
                  }(_model.connectionState!)) {
                    await Future.delayed(const Duration(milliseconds: 1000));

                    context.goNamed(
                      'Settings',
                      queryParams: {
                        'deviceID': serializeParam(
                          (String varConnState) {
                            return varConnState.split(":")[1];
                          }(_model.connectionState!),
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  } else {
                    HapticFeedback.mediumImpact();
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Device not found'),
                          content: Text(
                              'Could not find Vision Buddy headset. Please ensure the headset is powered on, and bluetooth is enabled on your mobile device.'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                    setState(() {
                      _model.connectionState = ' ';
                    });
                  }

                  setState(() {});
                },
                text: 'Connect',
                options: FFButtonOptions(
                  width: 200,
                  height: 50,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
