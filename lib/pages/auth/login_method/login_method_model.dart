import '/auth/firebase_auth/auth_util.dart';
import '/components/other_component/divider_text/divider_text_widget.dart';
import '/components/sign_component/signinwith_google/signinwith_google_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'login_method_widget.dart' show LoginMethodWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginMethodModel extends FlutterFlowModel<LoginMethodWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SigninwithGoogle component.
  late SigninwithGoogleModel signinwithGoogleModel1;
  // Model for SigninwithGoogle component.
  late SigninwithGoogleModel signinwithGoogleModel2;
  // Model for DividerText.
  late DividerTextModel dividerTextModel;

  @override
  void initState(BuildContext context) {
    signinwithGoogleModel1 =
        createModel(context, () => SigninwithGoogleModel());
    signinwithGoogleModel2 =
        createModel(context, () => SigninwithGoogleModel());
    dividerTextModel = createModel(context, () => DividerTextModel());
  }

  @override
  void dispose() {
    signinwithGoogleModel1.dispose();
    signinwithGoogleModel2.dispose();
    dividerTextModel.dispose();
  }
}
