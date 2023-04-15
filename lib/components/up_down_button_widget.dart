import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'up_down_button_model.dart';
export 'up_down_button_model.dart';

class UpDownButtonWidget extends StatefulWidget {
  const UpDownButtonWidget({
    Key? key,
    String? settingName,
    this.commandName,
    this.serviceID,
    this.characteristicID,
    this.maxSettingValue,
    this.minSettingValue,
    int? deltaValue,
  })  : this.settingName = settingName ?? 'Setting',
        this.deltaValue = deltaValue ?? 1,
        super(key: key);

  final String settingName;
  final String? commandName;
  final String? serviceID;
  final String? characteristicID;
  final int? maxSettingValue;
  final int? minSettingValue;
  final int deltaValue;

  @override
  _UpDownButtonWidgetState createState() => _UpDownButtonWidgetState();
}

class _UpDownButtonWidgetState extends State<UpDownButtonWidget> {
  late UpDownButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpDownButtonModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.deviceID = FFAppState().connectedDeviceID;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: 300.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          border: Border.all(
            color: Color(0x50E0E3E7),
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderRadius: 0.0,
                borderWidth: 1.0,
                buttonSize: 90.0,
                icon: Icon(
                  Icons.keyboard_arrow_up_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 70.0,
                ),
                onPressed: () async {
                  if (_model.settingValue! < widget.maxSettingValue!) {
                    setState(() {
                      _model.settingValue =
                          _model.settingValue! + widget.deltaValue;
                    });
                    await actions.sendCommandOverBluetooth(
                      widget.commandName!,
                      valueOrDefault<String>(
                        _model.settingValue?.toString(),
                        'None',
                      ),
                      FFAppState().connectedDeviceID,
                      widget.serviceID!,
                      widget.characteristicID!,
                    );
                  } else {
                    HapticFeedback.mediumImpact();
                  }
                },
              ),
              Text(
                valueOrDefault<String>(
                  _model.settingValue?.toString(),
                  '10',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 24.0,
                    ),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 0.0,
                borderWidth: 1.0,
                buttonSize: 90.0,
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 50.0,
                ),
                onPressed: () async {
                  if (_model.settingValue! > widget.minSettingValue!) {
                    setState(() {
                      _model.settingValue = _model.settingValue! +
                          valueOrDefault<int>(
                            -1 * widget.deltaValue,
                            1,
                          );
                    });
                    await actions.sendCommandOverBluetooth(
                      widget.commandName!,
                      valueOrDefault<String>(
                        _model.settingValue?.toString(),
                        'None',
                      ),
                      FFAppState().connectedDeviceID,
                      widget.serviceID!,
                      widget.characteristicID!,
                    );
                  } else {
                    HapticFeedback.mediumImpact();
                  }
                },
              ),
              Text(
                valueOrDefault<String>(
                  widget.settingName,
                  'Setting',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).tertiary,
                      fontSize: 18.0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
