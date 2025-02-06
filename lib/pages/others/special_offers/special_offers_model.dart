import '/components/other_component/header/header_widget.dart';
import '/components/other_component/setting_item/setting_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'special_offers_widget.dart' show SpecialOffersWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SpecialOffersModel extends FlutterFlowModel<SpecialOffersWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for becomeadistributor.
  late SettingItemModel becomeadistributorModel;
  // Model for Alreadyadistributor.
  late SettingItemModel alreadyadistributorModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    becomeadistributorModel = createModel(context, () => SettingItemModel());
    alreadyadistributorModel = createModel(context, () => SettingItemModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    becomeadistributorModel.dispose();
    alreadyadistributorModel.dispose();
  }
}
