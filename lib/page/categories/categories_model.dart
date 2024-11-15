import '/backend/backend.dart';
import '/components/nav_cater_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'categories_widget.dart' show CategoriesWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoriesModel extends FlutterFlowModel<CategoriesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavCater component.
  late NavCaterModel navCaterModel;

  @override
  void initState(BuildContext context) {
    navCaterModel = createModel(context, () => NavCaterModel());
  }

  @override
  void dispose() {
    navCaterModel.dispose();
  }
}
