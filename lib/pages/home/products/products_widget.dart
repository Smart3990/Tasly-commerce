import '/backend/backend.dart';
import '/components/other_component/empty/empty_widget.dart';
import '/components/other_component/header/header_widget.dart';
import '/components/product_component/product_item/product_item_widget.dart';
import '/components/specialoffer_c_omp/special_offer_card/special_offer_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'products_model.dart';
export 'products_model.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({
    super.key,
    String? pageTitle,
    this.specialOffer,
    bool? showMostPopular,
    bool? showSpecialOffer,
    String? showActiveCategory,
  })  : this.pageTitle = pageTitle ?? 'Most Popular',
        this.showMostPopular = showMostPopular ?? false,
        this.showSpecialOffer = showSpecialOffer ?? false,
        this.showActiveCategory = showActiveCategory ?? 'All';

  final String pageTitle;
  final SpecialOfferRecord? specialOffer;
  final bool showMostPopular;
  final bool showSpecialOffer;
  final String showActiveCategory;

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  late ProductsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.categori = widget!.showActiveCategory;
      safeSetState(() {});
    });

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
        title: 'Products',
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    wrapWithModel(
                      model: _model.headerModel,
                      updateCallback: () => safeSetState(() {}),
                      child: HeaderWidget(
                        title: widget!.pageTitle,
                        showBackButton: true,
                      ),
                    ),
                    if (widget!.showSpecialOffer &&
                        (widget!.specialOffer != null))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14.0),
                          child: Container(
                            width: double.infinity,
                            height: 150.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: wrapWithModel(
                              model: _model.specialOfferCardModel,
                              updateCallback: () => safeSetState(() {}),
                              child: SpecialOfferCardWidget(
                                title: widget!.specialOffer!.title,
                                description: widget!.specialOffer!.description,
                                image: widget!.specialOffer!.image,
                              ),
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FutureBuilder<List<ProductRecord>>(
                        future: queryProductRecordOnce(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 44.0,
                                height: 44.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ProductRecord> containerProductRecordList =
                              snapshot.data!;

                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final product = containerProductRecordList
                                      .where((e) => valueOrDefault<bool>(
                                            () {
                                              if (!widget!.showMostPopular &&
                                                  !widget!.showSpecialOffer) {
                                                return ((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori));
                                              } else if (widget!
                                                  .showMostPopular) {
                                                return (((_model.categori ==
                                                            'All') ||
                                                        (e.category ==
                                                            _model.categori)) &&
                                                    e.popular);
                                              } else if (widget!
                                                      .showSpecialOffer &&
                                                  (widget!.specialOffer !=
                                                      null)) {
                                                return (e.specialOffer &&
                                                    (e.specialOfferRef ==
                                                        widget!.specialOffer
                                                            ?.reference) &&
                                                    ((_model.categori ==
                                                            'All') ||
                                                        (e.category ==
                                                            _model.categori)));
                                              } else if (widget!
                                                  .showSpecialOffer) {
                                                return (((_model.categori ==
                                                            'All') ||
                                                        (e.category ==
                                                            _model.categori)) &&
                                                    e.specialOffer);
                                              } else {
                                                return true;
                                              }
                                            }(),
                                            true,
                                          ))
                                      .toList();
                                  if (product.isEmpty) {
                                    return EmptyWidget(
                                      icon: Icon(
                                        FFIcons.kshoppingCart,
                                        size: 32.0,
                                      ),
                                      title: 'No Product!',
                                      body:
                                          'There is no product in this categori',
                                      customAction: () async {},
                                    );
                                  }

                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: 0.55,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: product.length,
                                    itemBuilder: (context, productIndex) {
                                      final productItem = product[productIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'ProductDetail',
                                            queryParameters: {
                                              'product': serializeParam(
                                                productItem,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'product': productItem,
                                            },
                                          );
                                        },
                                        child: ProductItemWidget(
                                          key: Key(
                                              'Key9je_${productIndex}_of_${product.length}'),
                                          price: productItem
                                              .productInformation.price,
                                          rate: productItem
                                              .productInformation.rate,
                                          totalSold: productItem
                                              .productInformation.sold,
                                          image: productItem
                                              .productInformation.productCover,
                                          itemName: productItem
                                              .productInformation.name,
                                          distributorPrice: productItem
                                              .productInformation
                                              .distributorPrice,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 24.0)),
                ),
              ),
            ),
          ),
        ));
  }
}
