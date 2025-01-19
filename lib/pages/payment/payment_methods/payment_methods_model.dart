import '/components/other_component/header/header_widget.dart';
import '/components/transaction_comp/payment_method_item/payment_method_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'payment_methods_widget.dart' show PaymentMethodsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentMethodsModel extends FlutterFlowModel<PaymentMethodsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for PaymentMethodItem component.
  late PaymentMethodItemModel paymentMethodItemModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    paymentMethodItemModel =
        createModel(context, () => PaymentMethodItemModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    paymentMethodItemModel.dispose();
  }
}
