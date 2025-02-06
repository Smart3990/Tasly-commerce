import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/other_component/birthday_update/birthday_update_widget.dart';
import '/components/other_component/header/header_widget.dart';
import '/components/other_component/succesmodal/succesmodal_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'distributot_registration_widget.dart'
    show DistributotRegistrationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DistributotRegistrationModel
    extends FlutterFlowModel<DistributotRegistrationWidget> {
  ///  Local state fields for this page.

  List<String> listOfUserNames = [];
  void addToListOfUserNames(String item) => listOfUserNames.add(item);
  void removeFromListOfUserNames(String item) => listOfUserNames.remove(item);
  void removeAtIndexFromListOfUserNames(int index) =>
      listOfUserNames.removeAt(index);
  void insertAtIndexInListOfUserNames(int index, String item) =>
      listOfUserNames.insert(index, item);
  void updateListOfUserNamesAtIndex(int index, Function(String) updateFn) =>
      listOfUserNames[index] = updateFn(listOfUserNames[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for FullNameTextField widget.
  FocusNode? fullNameTextFieldFocusNode;
  TextEditingController? fullNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      fullNameTextFieldTextControllerValidator;
  String? _fullNameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9ig2yq9e' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  String? _emailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hpiqqdn4' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for tf_phone widget.
  FocusNode? tfPhoneFocusNode;
  TextEditingController? tfPhoneTextController;
  String? Function(BuildContext, String?)? tfPhoneTextControllerValidator;
  String? _tfPhoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pzhezrop' /* +233756746744 is required */,
      );
    }

    return null;
  }

  // Model for BirthdayUpdate component.
  late BirthdayUpdateModel birthdayUpdateModel;
  // State field(s) for MaritalSrtatus widget.
  String? maritalSrtatusValue;
  FormFieldController<String>? maritalSrtatusValueController;
  // State field(s) for dd-gender widget.
  String? ddGenderValue;
  FormFieldController<String>? ddGenderValueController;
  // State field(s) for Nationality widget.
  String? nationalityValue;
  FormFieldController<String>? nationalityValueController;
  // State field(s) for houseaddress widget.
  FocusNode? houseaddressFocusNode;
  TextEditingController? houseaddressTextController;
  String? Function(BuildContext, String?)? houseaddressTextControllerValidator;
  String? _houseaddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uovlxxte' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for NationalIDCard widget.
  FocusNode? nationalIDCardFocusNode;
  TextEditingController? nationalIDCardTextController;
  String? Function(BuildContext, String?)?
      nationalIDCardTextControllerValidator;
  String? _nationalIDCardTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd336zdfr' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Bankname widget.
  FocusNode? banknameFocusNode;
  TextEditingController? banknameTextController;
  String? Function(BuildContext, String?)? banknameTextControllerValidator;
  String? _banknameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'extz9oc4' /* bankName is required */,
      );
    }

    return null;
  }

  // State field(s) for bankBranch widget.
  FocusNode? bankBranchFocusNode;
  TextEditingController? bankBranchTextController;
  String? Function(BuildContext, String?)? bankBranchTextControllerValidator;
  String? _bankBranchTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8gv24u11' /* bankBranch is required */,
      );
    }

    return null;
  }

  // State field(s) for AccountName widget.
  FocusNode? accountNameFocusNode;
  TextEditingController? accountNameTextController;
  String? Function(BuildContext, String?)? accountNameTextControllerValidator;
  String? _accountNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mn76hl95' /* AccName is required */,
      );
    }

    return null;
  }

  // State field(s) for AccountNNumber widget.
  FocusNode? accountNNumberFocusNode;
  TextEditingController? accountNNumberTextController;
  String? Function(BuildContext, String?)?
      accountNNumberTextControllerValidator;
  String? _accountNNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9qslwa1h' /* AccNumber is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    fullNameTextFieldTextControllerValidator =
        _fullNameTextFieldTextControllerValidator;
    emailTextFieldTextControllerValidator =
        _emailTextFieldTextControllerValidator;
    tfPhoneTextControllerValidator = _tfPhoneTextControllerValidator;
    birthdayUpdateModel = createModel(context, () => BirthdayUpdateModel());
    houseaddressTextControllerValidator = _houseaddressTextControllerValidator;
    nationalIDCardTextControllerValidator =
        _nationalIDCardTextControllerValidator;
    banknameTextControllerValidator = _banknameTextControllerValidator;
    bankBranchTextControllerValidator = _bankBranchTextControllerValidator;
    accountNameTextControllerValidator = _accountNameTextControllerValidator;
    accountNNumberTextControllerValidator =
        _accountNNumberTextControllerValidator;
  }

  @override
  void dispose() {
    headerModel.dispose();
    fullNameTextFieldFocusNode?.dispose();
    fullNameTextFieldTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    tfPhoneFocusNode?.dispose();
    tfPhoneTextController?.dispose();

    birthdayUpdateModel.dispose();
    houseaddressFocusNode?.dispose();
    houseaddressTextController?.dispose();

    nationalIDCardFocusNode?.dispose();
    nationalIDCardTextController?.dispose();

    banknameFocusNode?.dispose();
    banknameTextController?.dispose();

    bankBranchFocusNode?.dispose();
    bankBranchTextController?.dispose();

    accountNameFocusNode?.dispose();
    accountNameTextController?.dispose();

    accountNNumberFocusNode?.dispose();
    accountNNumberTextController?.dispose();
  }
}
