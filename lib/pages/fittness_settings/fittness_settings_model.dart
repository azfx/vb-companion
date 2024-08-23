import '/components/disconnected_state/disconnected_state_widget.dart';
import '/components/v_b_button_component/v_b_button_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'fittness_settings_widget.dart' show FittnessSettingsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FittnessSettingsModel extends FlutterFlowModel<FittnessSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for VBButtonComponent component.
  late VBButtonComponentModel vBButtonComponentModel1;
  // Model for VBButtonComponent component.
  late VBButtonComponentModel vBButtonComponentModel2;
  // Model for VBButtonComponent component.
  late VBButtonComponentModel vBButtonComponentModel3;
  // Model for VBButtonComponent component.
  late VBButtonComponentModel vBButtonComponentModel4;
  // Model for VBButtonComponent component.
  late VBButtonComponentModel vBButtonComponentModel5;
  // Model for DisconnectedState component.
  late DisconnectedStateModel disconnectedStateModel;

  @override
  void initState(BuildContext context) {
    vBButtonComponentModel1 =
        createModel(context, () => VBButtonComponentModel());
    vBButtonComponentModel2 =
        createModel(context, () => VBButtonComponentModel());
    vBButtonComponentModel3 =
        createModel(context, () => VBButtonComponentModel());
    vBButtonComponentModel4 =
        createModel(context, () => VBButtonComponentModel());
    vBButtonComponentModel5 =
        createModel(context, () => VBButtonComponentModel());
    disconnectedStateModel =
        createModel(context, () => DisconnectedStateModel());
  }

  @override
  void dispose() {
    vBButtonComponentModel1.dispose();
    vBButtonComponentModel2.dispose();
    vBButtonComponentModel3.dispose();
    vBButtonComponentModel4.dispose();
    vBButtonComponentModel5.dispose();
    disconnectedStateModel.dispose();
  }
}
