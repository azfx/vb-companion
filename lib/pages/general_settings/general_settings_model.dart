import '/components/disconnected_state/disconnected_state_widget.dart';
import '/components/v_b_button_component/v_b_button_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GeneralSettingsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for VBButtonComponent component.
  late VBButtonComponentModel vBButtonComponentModel1;
  // Model for VBButtonComponent component.
  late VBButtonComponentModel vBButtonComponentModel2;
  // Model for VBButtonComponent component.
  late VBButtonComponentModel vBButtonComponentModel3;
  // Model for DisconnectedState component.
  late DisconnectedStateModel disconnectedStateModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    vBButtonComponentModel1 =
        createModel(context, () => VBButtonComponentModel());
    vBButtonComponentModel2 =
        createModel(context, () => VBButtonComponentModel());
    vBButtonComponentModel3 =
        createModel(context, () => VBButtonComponentModel());
    disconnectedStateModel =
        createModel(context, () => DisconnectedStateModel());
  }

  void dispose() {
    vBButtonComponentModel1.dispose();
    vBButtonComponentModel2.dispose();
    vBButtonComponentModel3.dispose();
    disconnectedStateModel.dispose();
  }

  /// Additional helper methods are added here.

}
