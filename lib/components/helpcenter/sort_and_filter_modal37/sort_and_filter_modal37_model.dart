import '/components/other_component/item_button/item_button_widget.dart';
import '/components/other_component/rating_item_button/rating_item_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'sort_and_filter_modal37_widget.dart' show SortAndFilterModal37Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SortAndFilterModal37Model
    extends FlutterFlowModel<SortAndFilterModal37Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for ItemButton component.
  late ItemButtonModel itemButtonModel;
  // Model for RatingItemButton component.
  late RatingItemButtonModel ratingItemButtonModel;

  @override
  void initState(BuildContext context) {
    itemButtonModel = createModel(context, () => ItemButtonModel());
    ratingItemButtonModel = createModel(context, () => RatingItemButtonModel());
  }

  @override
  void dispose() {
    itemButtonModel.dispose();
    ratingItemButtonModel.dispose();
  }
}
