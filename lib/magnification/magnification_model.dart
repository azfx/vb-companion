import '/components/up_down_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MagnificationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for UpDownButton component.
  late UpDownButtonModel upDownButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    upDownButtonModel = createModel(context, () => UpDownButtonModel());
  }

  void dispose() {
    upDownButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
