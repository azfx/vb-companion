import '/components/disconnected_state/disconnected_state_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'setup_wifi_widget.dart' show SetupWifiWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetupWifiModel extends FlutterFlowModel<SetupWifiWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for DisconnectedState component.
  late DisconnectedStateModel disconnectedStateModel;
  // State field(s) for SSID widget.
  FocusNode? ssidFocusNode;
  TextEditingController? ssidTextController;
  String? Function(BuildContext, String?)? ssidTextControllerValidator;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    disconnectedStateModel =
        createModel(context, () => DisconnectedStateModel());
  }

  @override
  void dispose() {
    disconnectedStateModel.dispose();
    ssidFocusNode?.dispose();
    ssidTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
