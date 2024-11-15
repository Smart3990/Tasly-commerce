import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'otp_widget.dart' show OtpWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OtpModel extends FlutterFlowModel<OtpWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCodemobile widget.
  TextEditingController? pinCodemobile;
  String? Function(BuildContext, String?)? pinCodemobileValidator;

  @override
  void initState(BuildContext context) {
    pinCodemobile = TextEditingController();
  }

  @override
  void dispose() {
    pinCodemobile?.dispose();
  }
}
