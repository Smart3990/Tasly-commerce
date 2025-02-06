import '/components/other_component/header/header_widget.dart';
import '/components/other_component/setting_item/setting_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'special_offers_model.dart';
export 'special_offers_model.dart';

class SpecialOffersWidget extends StatefulWidget {
  const SpecialOffersWidget({super.key});

  @override
  State<SpecialOffersWidget> createState() => _SpecialOffersWidgetState();
}

class _SpecialOffersWidgetState extends State<SpecialOffersWidget> {
  late SpecialOffersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecialOffersModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'SpecialOffers',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  wrapWithModel(
                    model: _model.headerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: HeaderWidget(
                      title: FFLocalizations.of(context).getText(
                        'h7pm8ha0' /* Special Offers */,
                      ),
                      showBackButton: true,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed('distributotRegistration');
                          },
                          child: wrapWithModel(
                            model: _model.becomeadistributorModel,
                            updateCallback: () => safeSetState(() {}),
                            child: SettingItemWidget(
                              walet: FFLocalizations.of(context).getText(
                                'n4ov7ci0' /* Become a distributor  */,
                              ),
                              icon: Icon(
                                FFIcons.ksquareLetterD,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed('Alreadydistributor');
                          },
                          child: wrapWithModel(
                            model: _model.alreadyadistributorModel,
                            updateCallback: () => safeSetState(() {}),
                            child: SettingItemWidget(
                              walet: FFLocalizations.of(context).getText(
                                '5c76haq4' /* Already a distributor  */,
                              ),
                              icon: Icon(
                                Icons.tag_faces,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
