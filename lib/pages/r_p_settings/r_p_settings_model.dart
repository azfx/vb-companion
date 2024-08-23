import '/components/disconnected_state/disconnected_state_widget.dart';
import '/components/up_down_button/up_down_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'r_p_settings_widget.dart' show RPSettingsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RPSettingsModel extends FlutterFlowModel<RPSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for UpDownButton component.
  late UpDownButtonModel upDownButtonModel;
  // Model for DisconnectedState component.
  late DisconnectedStateModel disconnectedStateModel;

  @override
  void initState(BuildContext context) {
    upDownButtonModel = createModel(context, () => UpDownButtonModel());
    disconnectedStateModel =
        createModel(context, () => DisconnectedStateModel());
  }

  @override
  void dispose() {
    upDownButtonModel.dispose();
    disconnectedStateModel.dispose();
  }
}
