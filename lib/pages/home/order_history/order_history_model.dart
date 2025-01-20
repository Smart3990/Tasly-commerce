import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_cop/nav_bar/nav_bar_widget.dart';
import '/components/other_component/empty/empty_widget.dart';
import '/components/other_component/header/header_widget.dart';
import '/components/product_component/order_ongoing_item/order_ongoing_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'order_history_widget.dart' show OrderHistoryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderHistoryModel extends FlutterFlowModel<OrderHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    tabBarController?.dispose();
    navBarModel.dispose();
  }
}
