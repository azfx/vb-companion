import '/components/disconnected_state_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'disconnected_model.dart';
export 'disconnected_model.dart';

class DisconnectedWidget extends StatefulWidget {
  const DisconnectedWidget({Key? key}) : super(key: key);

  @override
  _DisconnectedWidgetState createState() => _DisconnectedWidgetState();
}

class _DisconnectedWidgetState extends State<DisconnectedWidget> {
  late DisconnectedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisconnectedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 1.0,
                decoration: BoxDecoration(),
                child: wrapWithModel(
                  model: _model.disconnectedStateModel,
                  updateCallback: () => setState(() {}),
                  child: DisconnectedStateWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
