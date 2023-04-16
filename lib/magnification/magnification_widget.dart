import '/components/up_down_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'magnification_model.dart';
export 'magnification_model.dart';

class MagnificationWidget extends StatefulWidget {
  const MagnificationWidget({Key? key}) : super(key: key);

  @override
  _MagnificationWidgetState createState() => _MagnificationWidgetState();
}

class _MagnificationWidgetState extends State<MagnificationWidget> {
  late MagnificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MagnificationModel());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          title: Text(
            'Magnification',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.upDownButtonModel,
                updateCallback: () => setState(() {}),
                child: UpDownButtonWidget(
                  settingName: 'Zoom',
                  commandName: 'setZoom',
                  serviceID: '37200001-7638-4216-B629-96AD40F79BB1',
                  characteristicID: '47200004-7638-4216-B629-96AD40F79BB1',
                  maxSettingValue: 10,
                  minSettingValue: 1,
                  deltaValue: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
