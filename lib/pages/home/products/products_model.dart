import '/backend/backend.dart';
import '/components/other_component/empty/empty_widget.dart';
import '/components/other_component/header/header_widget.dart';
import '/components/product_component/product_item/product_item_widget.dart';
import '/components/specialoffer_c_omp/special_offer_card/special_offer_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'products_widget.dart' show ProductsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductsModel extends FlutterFlowModel<ProductsWidget> {
  ///  Local state fields for this page.

  String categori = 'All';

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for SpecialOfferCard component.
  late SpecialOfferCardModel specialOfferCardModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    specialOfferCardModel = createModel(context, () => SpecialOfferCardModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    specialOfferCardModel.dispose();
  }
}
