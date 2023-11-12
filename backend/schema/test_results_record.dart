import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestResultsRecord extends FirestoreRecord {
  TestResultsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nameTest" field.
  String? _nameTest;
  String get nameTest => _nameTest ?? '';
  bool hasNameTest() => _nameTest != null;

  // "descTest" field.
  String? _descTest;
  String get descTest => _descTest ?? '';
  bool hasDescTest() => _descTest != null;

  // "createdTime_test" field.
  DateTime? _createdTimeTest;
  DateTime? get createdTimeTest => _createdTimeTest;
  bool hasCreatedTimeTest() => _createdTimeTest != null;

  // "modifiedTime_test" field.
  DateTime? _modifiedTimeTest;
  DateTime? get modifiedTimeTest => _modifiedTimeTest;
  bool hasModifiedTimeTest() => _modifiedTimeTest != null;

  // "createdForPatient" field.
  DocumentReference? _createdForPatient;
  DocumentReference? get createdForPatient => _createdForPatient;
  bool hasCreatedForPatient() => _createdForPatient != null;

  // "photoTest" field.
  String? _photoTest;
  String get photoTest => _photoTest ?? '';
  bool hasPhotoTest() => _photoTest != null;

  void _initializeFields() {
    _nameTest = snapshotData['nameTest'] as String?;
    _descTest = snapshotData['descTest'] as String?;
    _createdTimeTest = snapshotData['createdTime_test'] as DateTime?;
    _modifiedTimeTest = snapshotData['modifiedTime_test'] as DateTime?;
    _createdForPatient =
        snapshotData['createdForPatient'] as DocumentReference?;
    _photoTest = snapshotData['photoTest'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('testResults');

  static Stream<TestResultsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestResultsRecord.fromSnapshot(s));

  static Future<TestResultsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestResultsRecord.fromSnapshot(s));

  static TestResultsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestResultsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestResultsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestResultsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestResultsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestResultsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestResultsRecordData({
  String? nameTest,
  String? descTest,
  DateTime? createdTimeTest,
  DateTime? modifiedTimeTest,
  DocumentReference? createdForPatient,
  String? photoTest,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nameTest': nameTest,
      'descTest': descTest,
      'createdTime_test': createdTimeTest,
      'modifiedTime_test': modifiedTimeTest,
      'createdForPatient': createdForPatient,
      'photoTest': photoTest,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestResultsRecordDocumentEquality implements Equality<TestResultsRecord> {
  const TestResultsRecordDocumentEquality();

  @override
  bool equals(TestResultsRecord? e1, TestResultsRecord? e2) {
    return e1?.nameTest == e2?.nameTest &&
        e1?.descTest == e2?.descTest &&
        e1?.createdTimeTest == e2?.createdTimeTest &&
        e1?.modifiedTimeTest == e2?.modifiedTimeTest &&
        e1?.createdForPatient == e2?.createdForPatient &&
        e1?.photoTest == e2?.photoTest;
  }

  @override
  int hash(TestResultsRecord? e) => const ListEquality().hash([
        e?.nameTest,
        e?.descTest,
        e?.createdTimeTest,
        e?.modifiedTimeTest,
        e?.createdForPatient,
        e?.photoTest
      ]);

  @override
  bool isValidKey(Object? o) => o is TestResultsRecord;
}
