import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/other_component/empty/empty_widget.dart';
import '/components/other_component/header/header_widget.dart';
import '/components/product_component/order_item/order_item_widget.dart';
import '/components/product_component/order_itemdis/order_itemdis_widget.dart';
import '/components/shipping_componenet/shipping_order/shipping_order_widget.dart';
import '/components/specialoffer_c_omp/promo_add/promo_add_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'check_out_widget.dart' show CheckOutWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckOutModel extends FlutterFlowModel<CheckOutWidget> {
  ///  Local state fields for this page.

  PromoCodesRecord? promoCodeAdded;

  double? promoPercent = 0.0;

  double? charges = 0.01;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ShippingOrder component.
  late ShippingOrderModel shippingOrderModel;
  // Model for empty component.
  late EmptyModel emptyModel;
  // Stores action output result for [Bottom Sheet - PromoAdd] action in IconButton widget.
  PromoCodesRecord? promoCode;
  // Stores action output result for [Backend Call - Read Document] action in buttondis widget.
  OrderRecord? updatedOrder;
  // Stores action output result for [Backend Call - Read Document] action in buttondis widget.
  OrderRecord? updatedOrderFinal1;
  // Stores action output result for [Backend Call - Read Document] action in Buttonregular widget.
  OrderRecord? updatedOrder1;
  // Stores action output result for [Backend Call - Read Document] action in Buttonregular widget.
  OrderRecord? updatedOrderFinal;
  // Stores action output result for [Backend Call - Read Document] action in Buttonregulartemp widget.
  OrderRecord? updatedOrder10;
  // Stores action output result for [Backend Call - Read Document] action in Buttonregulartemp widget.
  OrderRecord? updatedOrderFinal10;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    shippingOrderModel = createModel(context, () => ShippingOrderModel());
    emptyModel = createModel(context, () => EmptyModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    shippingOrderModel.dispose();
    emptyModel.dispose();
  }
}
