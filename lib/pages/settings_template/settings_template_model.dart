import '/components/disconnected_state/disconnected_state_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsTemplateModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for DisconnectedState component.
  late DisconnectedStateModel disconnectedStateModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    disconnectedStateModel =
        createModel(context, () => DisconnectedStateModel());
  }

  void dispose() {
    disconnectedStateModel.dispose();
  }

  /// Additional helper methods are added here.

}
