import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/other_component/on_board_complete_modal/on_board_complete_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'security_pass_widget.dart' show SecurityPassWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SecurityPassModel extends FlutterFlowModel<SecurityPassWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for securitypassfield widget.
  FocusNode? securitypassfieldFocusNode;
  TextEditingController? securitypassfieldTextController;
  late bool securitypassfieldVisibility;
  String? Function(BuildContext, String?)?
      securitypassfieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    securitypassfieldVisibility = false;
  }

  @override
  void dispose() {
    securitypassfieldFocusNode?.dispose();
    securitypassfieldTextController?.dispose();
  }
}
