import '/components/disconnected_state/disconnected_state_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'eye_tests_widget.dart' show EyeTestsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EyeTestsModel extends FlutterFlowModel<EyeTestsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DisconnectedState component.
  late DisconnectedStateModel disconnectedStateModel;

  @override
  void initState(BuildContext context) {
    disconnectedStateModel =
        createModel(context, () => DisconnectedStateModel());
  }

  @override
  void dispose() {
    disconnectedStateModel.dispose();
  }
}
