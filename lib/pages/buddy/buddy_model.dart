import '/components/v_b_button_component/v_b_button_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BuddyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for VBButtonComponent component.
  late VBButtonComponentModel vBButtonComponentModel1;
  // Model for VBButtonComponent component.
  late VBButtonComponentModel vBButtonComponentModel2;
  // Model for VBButtonComponent component.
  late VBButtonComponentModel vBButtonComponentModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    vBButtonComponentModel1 =
        createModel(context, () => VBButtonComponentModel());
    vBButtonComponentModel2 =
        createModel(context, () => VBButtonComponentModel());
    vBButtonComponentModel3 =
        createModel(context, () => VBButtonComponentModel());
  }

  void dispose() {
    vBButtonComponentModel1.dispose();
    vBButtonComponentModel2.dispose();
    vBButtonComponentModel3.dispose();
  }

  /// Additional helper methods are added here.

}
