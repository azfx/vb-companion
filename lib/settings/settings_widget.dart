import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({
    Key? key,
    this.deviceID,
  }) : super(key: key);

  final String? deviceID;

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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.initializeDevice(
        widget.deviceID!,
      );
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
              Container(
                width: double.infinity,
                height: 50,
                child: custom_widgets.BlueToothDeviceSlider(
                  width: double.infinity,
                  height: 50,
                  deviceID: widget.deviceID!,
                ),
              ),
              Slider.adaptive(
                activeColor: Color(0xFFFFFF00),
                inactiveColor: FlutterFlowTheme.of(context).lineColor,
                min: 128,
                max: 255,
                value: _model.sliderValue ??= _model.brightness.toDouble(),
                label: _model.sliderValue.toString(),
                divisions: 127,
                onChanged: (newValue) {
                  newValue = double.parse(newValue.toStringAsFixed(0));
                  setState(() => _model.sliderValue = newValue);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
