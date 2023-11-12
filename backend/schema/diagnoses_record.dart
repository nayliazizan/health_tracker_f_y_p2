import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiagnosesRecord extends FirestoreRecord {
  DiagnosesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nameDiagnosis" field.
  String? _nameDiagnosis;
  String get nameDiagnosis => _nameDiagnosis ?? '';
  bool hasNameDiagnosis() => _nameDiagnosis != null;

  // "descDiagnosis" field.
  String? _descDiagnosis;
  String get descDiagnosis => _descDiagnosis ?? '';
  bool hasDescDiagnosis() => _descDiagnosis != null;

  // "modifiedTime_diagnosis" field.
  DateTime? _modifiedTimeDiagnosis;
  DateTime? get modifiedTimeDiagnosis => _modifiedTimeDiagnosis;
  bool hasModifiedTimeDiagnosis() => _modifiedTimeDiagnosis != null;

  // "createdForPatient" field.
  DocumentReference? _createdForPatient;
  DocumentReference? get createdForPatient => _createdForPatient;
  bool hasCreatedForPatient() => _createdForPatient != null;

  // "photoDiagnosis" field.
  String? _photoDiagnosis;
  String get photoDiagnosis => _photoDiagnosis ?? '';
  bool hasPhotoDiagnosis() => _photoDiagnosis != null;

  // "dateDiagnosed" field.
  DateTime? _dateDiagnosed;
  DateTime? get dateDiagnosed => _dateDiagnosed;
  bool hasDateDiagnosed() => _dateDiagnosed != null;

  void _initializeFields() {
    _nameDiagnosis = snapshotData['nameDiagnosis'] as String?;
    _descDiagnosis = snapshotData['descDiagnosis'] as String?;
    _modifiedTimeDiagnosis =
        snapshotData['modifiedTime_diagnosis'] as DateTime?;
    _createdForPatient =
        snapshotData['createdForPatient'] as DocumentReference?;
    _photoDiagnosis = snapshotData['photoDiagnosis'] as String?;
    _dateDiagnosed = snapshotData['dateDiagnosed'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('diagnoses');

  static Stream<DiagnosesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiagnosesRecord.fromSnapshot(s));

  static Future<DiagnosesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DiagnosesRecord.fromSnapshot(s));

  static DiagnosesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiagnosesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiagnosesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiagnosesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiagnosesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiagnosesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiagnosesRecordData({
  String? nameDiagnosis,
  String? descDiagnosis,
  DateTime? modifiedTimeDiagnosis,
  DocumentReference? createdForPatient,
  String? photoDiagnosis,
  DateTime? dateDiagnosed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nameDiagnosis': nameDiagnosis,
      'descDiagnosis': descDiagnosis,
      'modifiedTime_diagnosis': modifiedTimeDiagnosis,
      'createdForPatient': createdForPatient,
      'photoDiagnosis': photoDiagnosis,
      'dateDiagnosed': dateDiagnosed,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiagnosesRecordDocumentEquality implements Equality<DiagnosesRecord> {
  const DiagnosesRecordDocumentEquality();

  @override
  bool equals(DiagnosesRecord? e1, DiagnosesRecord? e2) {
    return e1?.nameDiagnosis == e2?.nameDiagnosis &&
        e1?.descDiagnosis == e2?.descDiagnosis &&
        e1?.modifiedTimeDiagnosis == e2?.modifiedTimeDiagnosis &&
        e1?.createdForPatient == e2?.createdForPatient &&
        e1?.photoDiagnosis == e2?.photoDiagnosis &&
        e1?.dateDiagnosed == e2?.dateDiagnosed;
  }

  @override
  int hash(DiagnosesRecord? e) => const ListEquality().hash([
        e?.nameDiagnosis,
        e?.descDiagnosis,
        e?.modifiedTimeDiagnosis,
        e?.createdForPatient,
        e?.photoDiagnosis,
        e?.dateDiagnosed
      ]);

  @override
  bool isValidKey(Object? o) => o is DiagnosesRecord;
}
