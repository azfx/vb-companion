import '/components/v_b_button_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuddyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for VBButtonComponent component.
  late VBButtonComponentModel vBButtonComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    vBButtonComponentModel =
        createModel(context, () => VBButtonComponentModel());
  }

  void dispose() {
    vBButtonComponentModel.dispose();
  }

  /// Additional helper methods are added here.

}
