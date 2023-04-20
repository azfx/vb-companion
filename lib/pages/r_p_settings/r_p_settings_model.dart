import '/components/disconnected_state/disconnected_state_widget.dart';
import '/components/up_down_button/up_down_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RPSettingsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for UpDownButton component.
  late UpDownButtonModel upDownButtonModel;
  // Model for DisconnectedState component.
  late DisconnectedStateModel disconnectedStateModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    upDownButtonModel = createModel(context, () => UpDownButtonModel());
    disconnectedStateModel =
        createModel(context, () => DisconnectedStateModel());
  }

  void dispose() {
    upDownButtonModel.dispose();
    disconnectedStateModel.dispose();
  }

  /// Additional helper methods are added here.

}
