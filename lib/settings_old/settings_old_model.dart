import '/components/up_down_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsOldModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;
  // Model for UpDownButton component.
  late UpDownButtonModel upDownButtonModel1;
  // Model for UpDownButton component.
  late UpDownButtonModel upDownButtonModel2;
  // Model for UpDownButton component.
  late UpDownButtonModel upDownButtonModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    upDownButtonModel1 = createModel(context, () => UpDownButtonModel());
    upDownButtonModel2 = createModel(context, () => UpDownButtonModel());
    upDownButtonModel3 = createModel(context, () => UpDownButtonModel());
  }

  void dispose() {
    upDownButtonModel1.dispose();
    upDownButtonModel2.dispose();
    upDownButtonModel3.dispose();
  }

  /// Additional helper methods are added here.

}
