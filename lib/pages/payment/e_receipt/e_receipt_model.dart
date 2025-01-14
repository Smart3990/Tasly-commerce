import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/other_component/header/header_widget.dart';
import '/components/other_component/receipt_status/receipt_status_widget.dart';
import '/components/product_component/order_ongoing_item/order_ongoing_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'e_receipt_widget.dart' show EReceiptWidget;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EReceiptModel extends FlutterFlowModel<EReceiptWidget> {
  ///  Local state fields for this page.

  double? charges = 0.01;

  PromoCodesRecord? promoCodeAdded;

  double? promoPercent = 0.0;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ReceiptStatus component.
  late ReceiptStatusModel receiptStatusModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    receiptStatusModel = createModel(context, () => ReceiptStatusModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    receiptStatusModel.dispose();
  }
}
