import '/components/up_down_button/up_down_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'settings_old_widget.dart' show SettingsOldWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsOldModel extends FlutterFlowModel<SettingsOldWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for UpDownButton component.
  late UpDownButtonModel upDownButtonModel1;
  // Model for UpDownButton component.
  late UpDownButtonModel upDownButtonModel2;
  // Model for UpDownButton component.
  late UpDownButtonModel upDownButtonModel3;

  @override
  void initState(BuildContext context) {
    upDownButtonModel1 = createModel(context, () => UpDownButtonModel());
    upDownButtonModel2 = createModel(context, () => UpDownButtonModel());
    upDownButtonModel3 = createModel(context, () => UpDownButtonModel());
  }

  @override
  void dispose() {
    upDownButtonModel1.dispose();
    upDownButtonModel2.dispose();
    upDownButtonModel3.dispose();
  }
}
