import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResourcesRecord extends FirestoreRecord {
  ResourcesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "resourceName" field.
  String? _resourceName;
  String get resourceName => _resourceName ?? '';
  bool hasResourceName() => _resourceName != null;

  // "resourceDesc" field.
  String? _resourceDesc;
  String get resourceDesc => _resourceDesc ?? '';
  bool hasResourceDesc() => _resourceDesc != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "linkurlWebsite" field.
  String? _linkurlWebsite;
  String get linkurlWebsite => _linkurlWebsite ?? '';
  bool hasLinkurlWebsite() => _linkurlWebsite != null;

  void _initializeFields() {
    _resourceName = snapshotData['resourceName'] as String?;
    _resourceDesc = snapshotData['resourceDesc'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _linkurlWebsite = snapshotData['linkurlWebsite'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resources');

  static Stream<ResourcesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResourcesRecord.fromSnapshot(s));

  static Future<ResourcesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResourcesRecord.fromSnapshot(s));

  static ResourcesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResourcesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResourcesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResourcesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResourcesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResourcesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResourcesRecordData({
  String? resourceName,
  String? resourceDesc,
  DocumentReference? user,
  String? linkurlWebsite,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'resourceName': resourceName,
      'resourceDesc': resourceDesc,
      'user': user,
      'linkurlWebsite': linkurlWebsite,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResourcesRecordDocumentEquality implements Equality<ResourcesRecord> {
  const ResourcesRecordDocumentEquality();

  @override
  bool equals(ResourcesRecord? e1, ResourcesRecord? e2) {
    return e1?.resourceName == e2?.resourceName &&
        e1?.resourceDesc == e2?.resourceDesc &&
        e1?.user == e2?.user &&
        e1?.linkurlWebsite == e2?.linkurlWebsite;
  }

  @override
  int hash(ResourcesRecord? e) => const ListEquality()
      .hash([e?.resourceName, e?.resourceDesc, e?.user, e?.linkurlWebsite]);

  @override
  bool isValidKey(Object? o) => o is ResourcesRecord;
}
