import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'e_d_i_d_settings_model.dart';
export 'e_d_i_d_settings_model.dart';

class EDIDSettingsWidget extends StatefulWidget {
  const EDIDSettingsWidget({super.key});

  @override
  State<EDIDSettingsWidget> createState() => _EDIDSettingsWidgetState();
}

class _EDIDSettingsWidgetState extends State<EDIDSettingsWidget>
    with TickerProviderStateMixin {
  late EDIDSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EDIDSettingsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.sendCommandOverBluetooth(
        'SENDEDIDS',
        'none',
        FFAppState().connectedDeviceID,
        '37200001-7638-4216-B629-96AD40F79BB1',
        '47200008-7638-4216-B629-96AD40F79BB1',
      );
      await Future.delayed(const Duration(milliseconds: 1000));
      await actions.getEDIDsFromHeadset(
        FFAppState().connectedDeviceID,
      );

      setState(() {});
    });

    animationsMap.addAll({
      'listTileOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).success,
            angle: 0.785,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
            'EDID SETTINGS',
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Builder(
                builder: (context) {
                  final edidList = FFAppState().edidList.toList();

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: edidList.length,
                    itemBuilder: (context, edidListIndex) {
                      final edidListItem = edidList[edidListIndex];
                      return Padding(
                        padding: EdgeInsets.all(6.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await actions.sendCommandOverBluetooth(
                              'SWITCHEDID',
                              edidListItem,
                              FFAppState().connectedDeviceID,
                              '37200001-7638-4216-B629-96AD40F79BB1',
                              '47200008-7638-4216-B629-96AD40F79BB1',
                            );
                            if (animationsMap[
                                    'listTileOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'listTileOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                          },
                          child: ListTile(
                            title: Text(
                              edidListItem,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Nunito',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: FlutterFlowTheme.of(context).primary,
                            dense: false,
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['listTileOnActionTriggerAnimation']!,
                        ),
                      );
                    },
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  'If this page is blank, please wait a few moments for the information to be retrieved.\n\nIf this issue persists, please ensure your Vision Buddy TV streamer is connected to a power source and turned on. Then, try refreshing this page.',
                  textAlign: TextAlign.justify,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nunito',
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
