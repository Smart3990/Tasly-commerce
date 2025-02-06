import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/other_component/header/header_widget.dart';
import '/components/other_component/succesmodal/succesmodal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'alreadydistributor_widget.dart' show AlreadydistributorWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AlreadydistributorModel
    extends FlutterFlowModel<AlreadydistributorWidget> {
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
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  String? _emailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nmtdt8yo' /* Field is required */,
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
        'wbujn4eq' /* +233756746744 is required */,
      );
    }

    return null;
  }

  // State field(s) for DistibutorId widget.
  FocusNode? distibutorIdFocusNode;
  TextEditingController? distibutorIdTextController;
  String? Function(BuildContext, String?)? distibutorIdTextControllerValidator;
  String? _distibutorIdTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3knlvqve' /* Distributor Id is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    emailTextFieldTextControllerValidator =
        _emailTextFieldTextControllerValidator;
    tfPhoneTextControllerValidator = _tfPhoneTextControllerValidator;
    distibutorIdTextControllerValidator = _distibutorIdTextControllerValidator;
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

    distibutorIdFocusNode?.dispose();
    distibutorIdTextController?.dispose();
  }
}
