// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartProductStruct extends FFFirebaseStruct {
  CartProductStruct({
    DocumentReference? productRef,
    String? name,
    String? image,
    double? distributorPrice,
    double? price,
    int? count,
    String? productID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productRef = productRef,
        _name = name,
        _image = image,
        _distributorPrice = distributorPrice,
        _price = price,
        _count = count,
        _productID = productID,
        super(firestoreUtilData);

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  set productRef(DocumentReference? val) => _productRef = val;

  bool hasProductRef() => _productRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "DistributorPrice" field.
  double? _distributorPrice;
  double get distributorPrice => _distributorPrice ?? 0.0;
  set distributorPrice(double? val) => _distributorPrice = val;

  void incrementDistributorPrice(double amount) =>
      distributorPrice = distributorPrice + amount;

  bool hasDistributorPrice() => _distributorPrice != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "productID" field.
  String? _productID;
  String get productID => _productID ?? '';
  set productID(String? val) => _productID = val;

  bool hasProductID() => _productID != null;

  static CartProductStruct fromMap(Map<String, dynamic> data) =>
      CartProductStruct(
        productRef: data['product_ref'] as DocumentReference?,
        name: data['name'] as String?,
        image: data['image'] as String?,
        distributorPrice: castToType<double>(data['DistributorPrice']),
        price: castToType<double>(data['price']),
        count: castToType<int>(data['count']),
        productID: data['productID'] as String?,
      );

  static CartProductStruct? maybeFromMap(dynamic data) => data is Map
      ? CartProductStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_ref': _productRef,
        'name': _name,
        'image': _image,
        'DistributorPrice': _distributorPrice,
        'price': _price,
        'count': _count,
        'productID': _productID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_ref': serializeParam(
          _productRef,
          ParamType.DocumentReference,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'DistributorPrice': serializeParam(
          _distributorPrice,
          ParamType.double,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'productID': serializeParam(
          _productID,
          ParamType.String,
        ),
      }.withoutNulls;

  static CartProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartProductStruct(
        productRef: deserializeParam(
          data['product_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['product'],
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        distributorPrice: deserializeParam(
          data['DistributorPrice'],
          ParamType.double,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        productID: deserializeParam(
          data['productID'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CartProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartProductStruct &&
        productRef == other.productRef &&
        name == other.name &&
        image == other.image &&
        distributorPrice == other.distributorPrice &&
        price == other.price &&
        count == other.count &&
        productID == other.productID;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [productRef, name, image, distributorPrice, price, count, productID]);
}

CartProductStruct createCartProductStruct({
  DocumentReference? productRef,
  String? name,
  String? image,
  double? distributorPrice,
  double? price,
  int? count,
  String? productID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartProductStruct(
      productRef: productRef,
      name: name,
      image: image,
      distributorPrice: distributorPrice,
      price: price,
      count: count,
      productID: productID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartProductStruct? updateCartProductStruct(
  CartProductStruct? cartProduct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartProduct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartProductStructData(
  Map<String, dynamic> firestoreData,
  CartProductStruct? cartProduct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartProduct == null) {
    return;
  }
  if (cartProduct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartProduct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartProductData =
      getCartProductFirestoreData(cartProduct, forFieldValue);
  final nestedData =
      cartProductData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartProduct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartProductFirestoreData(
  CartProductStruct? cartProduct, [
  bool forFieldValue = false,
]) {
  if (cartProduct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartProduct.toMap());

  // Add any Firestore field values
  cartProduct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartProductListFirestoreData(
  List<CartProductStruct>? cartProducts,
) =>
    cartProducts?.map((e) => getCartProductFirestoreData(e, true)).toList() ??
    [];
