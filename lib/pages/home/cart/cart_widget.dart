import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav_cop/nav_bar/nav_bar_widget.dart';
import '/components/other_component/empty/empty_widget.dart';
import '/components/product_component/order_item/order_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
export 'cart_model.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  late CartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<CartRecord>(
        stream: CartRecord.getDocument(currentUserDocument!.cartRef!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Center(
                child: SizedBox(
                  width: 44.0,
                  height: 44.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
            );
          }

          final cartCartRecord = snapshot.data!;

          return Title(
              title: 'Cart',
              color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  body: SafeArea(
                    top: true,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'ga7suyqp' /* My Cart */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  final product =
                                      cartCartRecord.products.toList();
                                  if (product.isEmpty) {
                                    return EmptyWidget(
                                      icon: Icon(
                                        FFIcons.kflashSettings,
                                        size: 32.0,
                                      ),
                                      title: 'Empty!',
                                      body:
                                          'Your cart is empty, Start shopping and add items to it.',
                                      customAction: () async {},
                                    );
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      24.0,
                                      0,
                                      100.0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: product.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 16.0),
                                    itemBuilder: (context, productIndex) {
                                      final productItem = product[productIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: OrderItemWidget(
                                          key: Key(
                                              'Key9nu_${productIndex}_of_${product.length}'),
                                          product: productItem,
                                          cartDocument: cartCartRecord,
                                          orderDocument: _model.orderCreated,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: wrapWithModel(
                              model: _model.navBarModel,
                              updateCallback: () => safeSetState(() {}),
                              child: NavBarWidget(
                                activePage: 'Cart',
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 85.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if ((cartCartRecord.products.length > 0) &&
                                      (cartCartRecord.products.isNotEmpty))
                                    FFButtonWidget(
                                      onPressed: () async {
                                        await NotificationsRecord.collection
                                            .doc()
                                            .set(createNotificationsRecordData(
                                              subject: 'Checkout',
                                              message:
                                                  'Your cart has been go to checkout and ready to pay.',
                                              userRef: currentUserReference,
                                              seen: false,
                                              date: getCurrentTimestamp,
                                            ));

                                        var orderRecordReference =
                                            OrderRecord.collection.doc();
                                        await orderRecordReference.set({
                                          ...createOrderRecordData(
                                            date: getCurrentTimestamp,
                                            status: 'Created',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'products':
                                                  getCartProductListFirestoreData(
                                                cartCartRecord.products,
                                              ),
                                              'shipping_timeline': [
                                                getOrderDeliveryTimelineFirestoreData(
                                                  createOrderDeliveryTimelineStruct(
                                                    date: getCurrentTimestamp,
                                                    description:
                                                        'Start checkout',
                                                    currentAddressOfPackage:
                                                        '-',
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                  true,
                                                )
                                              ],
                                            },
                                          ),
                                        });
                                        _model.orderCreated =
                                            OrderRecord.getDocumentFromData({
                                          ...createOrderRecordData(
                                            date: getCurrentTimestamp,
                                            status: 'Created',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'products':
                                                  getCartProductListFirestoreData(
                                                cartCartRecord.products,
                                              ),
                                              'shipping_timeline': [
                                                getOrderDeliveryTimelineFirestoreData(
                                                  createOrderDeliveryTimelineStruct(
                                                    date: getCurrentTimestamp,
                                                    description:
                                                        'Start checkout',
                                                    currentAddressOfPackage:
                                                        '-',
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                  true,
                                                )
                                              ],
                                            },
                                          ),
                                        }, orderRecordReference);

                                        context.pushNamed(
                                          'CheckOut',
                                          queryParameters: {
                                            'orderRef': serializeParam(
                                              _model.orderCreated?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );

                                        safeSetState(() {});
                                      },
                                      text: 'Checkout  ${formatNumber(
                                        functions.sumCartPrices(
                                            cartCartRecord.products.toList()),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                        currency: 'GHC ',
                                      )}',
                                      options: FFButtonOptions(
                                        height: 54.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .buttonBlack,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 10.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
