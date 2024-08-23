import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'up_down_button_widget.dart' show UpDownButtonWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpDownButtonModel extends FlutterFlowModel<UpDownButtonWidget> {
  ///  Local state fields for this component.

  String? deviceID;

  int? settingValue = 10;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
