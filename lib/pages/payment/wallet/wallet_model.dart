import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_cop/nav_bar/nav_bar_widget.dart';
import '/components/other_component/empty/empty_widget.dart';
import '/components/transaction_comp/money_card/money_card_widget.dart';
import '/components/transaction_comp/transaction_history_item/transaction_history_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'wallet_widget.dart' show WalletWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WalletModel extends FlutterFlowModel<WalletWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MoneyCard component.
  late MoneyCardModel moneyCardModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    moneyCardModel = createModel(context, () => MoneyCardModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    moneyCardModel.dispose();
    navBarModel.dispose();
  }
}
