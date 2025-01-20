import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_cop/nav_bar/nav_bar_widget.dart';
import '/components/other_component/logout_confirm_modal/logout_confirm_modal_widget.dart';
import '/components/other_component/setting_item/setting_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'profile_widget.dart' show ProfileWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for support.
  late SettingItemModel supportModel;
  // Model for addresses.
  late SettingItemModel addressesModel;
  // Model for paymethods.
  late SettingItemModel paymethodsModel1;
  // Model for card.
  late SettingItemModel cardModel;
  // Model for walet.
  late SettingItemModel waletModel;
  // Model for paymethods.
  late SettingItemModel paymethodsModel2;
  // Model for SettingItem component.
  late SettingItemModel settingItemModel1;
  // Model for SettingItem component.
  late SettingItemModel settingItemModel2;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for privacy.
  late SettingItemModel privacyModel;
  // Model for MessageDeveloper.
  late SettingItemModel messageDeveloperModel;
  // Model for helpcenter.
  late SettingItemModel helpcenterModel;
  // Model for invite.
  late SettingItemModel inviteModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    supportModel = createModel(context, () => SettingItemModel());
    addressesModel = createModel(context, () => SettingItemModel());
    paymethodsModel1 = createModel(context, () => SettingItemModel());
    cardModel = createModel(context, () => SettingItemModel());
    waletModel = createModel(context, () => SettingItemModel());
    paymethodsModel2 = createModel(context, () => SettingItemModel());
    settingItemModel1 = createModel(context, () => SettingItemModel());
    settingItemModel2 = createModel(context, () => SettingItemModel());
    privacyModel = createModel(context, () => SettingItemModel());
    messageDeveloperModel = createModel(context, () => SettingItemModel());
    helpcenterModel = createModel(context, () => SettingItemModel());
    inviteModel = createModel(context, () => SettingItemModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    supportModel.dispose();
    addressesModel.dispose();
    paymethodsModel1.dispose();
    cardModel.dispose();
    waletModel.dispose();
    paymethodsModel2.dispose();
    settingItemModel1.dispose();
    settingItemModel2.dispose();
    privacyModel.dispose();
    messageDeveloperModel.dispose();
    helpcenterModel.dispose();
    inviteModel.dispose();
    navBarModel.dispose();
  }
}
