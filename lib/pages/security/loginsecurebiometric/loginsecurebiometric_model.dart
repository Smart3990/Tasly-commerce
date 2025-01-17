import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/other_component/header/header_widget.dart';
import '/components/other_component/info_confirm_modal/info_confirm_modal_widget.dart';
import '/components/other_component/on_board_complete_modal/on_board_complete_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'loginsecurebiometric_widget.dart' show LoginsecurebiometricWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginsecurebiometricModel
    extends FlutterFlowModel<LoginsecurebiometricWidget> {
  ///  State fields for stateful widgets in this page.

  bool biometricEnabled = false;
  // Model for Header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
