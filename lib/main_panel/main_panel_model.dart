import '/components/disconnected_state_widget.dart';
import '/components/up_down_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPanelModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for UpDownButton component.
  late UpDownButtonModel upDownButtonModel1;
  // Model for UpDownButton component.
  late UpDownButtonModel upDownButtonModel2;
  // Model for UpDownButton component.
  late UpDownButtonModel upDownButtonModel3;
  // Model for DisconnectedState component.
  late DisconnectedStateModel disconnectedStateModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    upDownButtonModel1 = createModel(context, () => UpDownButtonModel());
    upDownButtonModel2 = createModel(context, () => UpDownButtonModel());
    upDownButtonModel3 = createModel(context, () => UpDownButtonModel());
    disconnectedStateModel =
        createModel(context, () => DisconnectedStateModel());
  }

  void dispose() {
    upDownButtonModel1.dispose();
    upDownButtonModel2.dispose();
    upDownButtonModel3.dispose();
    disconnectedStateModel.dispose();
  }

  /// Additional helper methods are added here.

}
