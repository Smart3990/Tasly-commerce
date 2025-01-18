import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestPinRecord extends FirestoreRecord {
  RequestPinRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "uploadPhoto" field.
  String? _uploadPhoto;
  String get uploadPhoto => _uploadPhoto ?? '';
  bool hasUploadPhoto() => _uploadPhoto != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _bio = snapshotData['bio'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _uploadPhoto = snapshotData['uploadPhoto'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('requestPin')
          : FirebaseFirestore.instance.collectionGroup('requestPin');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('requestPin').doc(id);

  static Stream<RequestPinRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestPinRecord.fromSnapshot(s));

  static Future<RequestPinRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestPinRecord.fromSnapshot(s));

  static RequestPinRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestPinRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestPinRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestPinRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestPinRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestPinRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestPinRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? bio,
  String? userName,
  String? uploadPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'bio': bio,
      'user_name': userName,
      'uploadPhoto': uploadPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestPinRecordDocumentEquality implements Equality<RequestPinRecord> {
  const RequestPinRecordDocumentEquality();

  @override
  bool equals(RequestPinRecord? e1, RequestPinRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.bio == e2?.bio &&
        e1?.userName == e2?.userName &&
        e1?.uploadPhoto == e2?.uploadPhoto;
  }

  @override
  int hash(RequestPinRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.bio,
        e?.userName,
        e?.uploadPhoto
      ]);

  @override
  bool isValidKey(Object? o) => o is RequestPinRecord;
}
