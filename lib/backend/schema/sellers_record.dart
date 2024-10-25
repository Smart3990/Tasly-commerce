import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SellersRecord extends FirestoreRecord {
  SellersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "pid" field.
  String? _pid;
  String get pid => _pid ?? '';
  bool hasPid() => _pid != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "Photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "seller_ref" field.
  DocumentReference? _sellerRef;
  DocumentReference? get sellerRef => _sellerRef;
  bool hasSellerRef() => _sellerRef != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _pid = snapshotData['pid'] as String?;
    _category = snapshotData['category'] as String?;
    _photoUrl = snapshotData['Photo_url'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _sellerRef = snapshotData['seller_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sellers');

  static Stream<SellersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SellersRecord.fromSnapshot(s));

  static Future<SellersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SellersRecord.fromSnapshot(s));

  static SellersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SellersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SellersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SellersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SellersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SellersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSellersRecordData({
  String? name,
  String? description,
  double? price,
  DateTime? createdAt,
  int? quantity,
  String? pid,
  String? category,
  String? photoUrl,
  DocumentReference? userRef,
  DocumentReference? sellerRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'created_at': createdAt,
      'quantity': quantity,
      'pid': pid,
      'category': category,
      'Photo_url': photoUrl,
      'user_ref': userRef,
      'seller_ref': sellerRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class SellersRecordDocumentEquality implements Equality<SellersRecord> {
  const SellersRecordDocumentEquality();

  @override
  bool equals(SellersRecord? e1, SellersRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.createdAt == e2?.createdAt &&
        e1?.quantity == e2?.quantity &&
        e1?.pid == e2?.pid &&
        e1?.category == e2?.category &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.userRef == e2?.userRef &&
        e1?.sellerRef == e2?.sellerRef;
  }

  @override
  int hash(SellersRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.price,
        e?.createdAt,
        e?.quantity,
        e?.pid,
        e?.category,
        e?.photoUrl,
        e?.userRef,
        e?.sellerRef
      ]);

  @override
  bool isValidKey(Object? o) => o is SellersRecord;
}
