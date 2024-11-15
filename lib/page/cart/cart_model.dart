import '/components/nav_cart_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavCart component.
  late NavCartModel navCartModel;

  @override
  void initState(BuildContext context) {
    navCartModel = createModel(context, () => NavCartModel());
  }

  @override
  void dispose() {
    navCartModel.dispose();
  }
}
