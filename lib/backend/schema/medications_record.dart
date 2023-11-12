import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationsRecord extends FirestoreRecord {
  MedicationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nameMedication" field.
  String? _nameMedication;
  String get nameMedication => _nameMedication ?? '';
  bool hasNameMedication() => _nameMedication != null;

  // "dateMedication" field.
  DateTime? _dateMedication;
  DateTime? get dateMedication => _dateMedication;
  bool hasDateMedication() => _dateMedication != null;

  // "dosage" field.
  String? _dosage;
  String get dosage => _dosage ?? '';
  bool hasDosage() => _dosage != null;

  // "frequencyInADay" field.
  String? _frequencyInADay;
  String get frequencyInADay => _frequencyInADay ?? '';
  bool hasFrequencyInADay() => _frequencyInADay != null;

  // "patient" field.
  DocumentReference? _patient;
  DocumentReference? get patient => _patient;
  bool hasPatient() => _patient != null;

  void _initializeFields() {
    _nameMedication = snapshotData['nameMedication'] as String?;
    _dateMedication = snapshotData['dateMedication'] as DateTime?;
    _dosage = snapshotData['dosage'] as String?;
    _frequencyInADay = snapshotData['frequencyInADay'] as String?;
    _patient = snapshotData['patient'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medications');

  static Stream<MedicationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicationsRecord.fromSnapshot(s));

  static Future<MedicationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicationsRecord.fromSnapshot(s));

  static MedicationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicationsRecordData({
  String? nameMedication,
  DateTime? dateMedication,
  String? dosage,
  String? frequencyInADay,
  DocumentReference? patient,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nameMedication': nameMedication,
      'dateMedication': dateMedication,
      'dosage': dosage,
      'frequencyInADay': frequencyInADay,
      'patient': patient,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicationsRecordDocumentEquality implements Equality<MedicationsRecord> {
  const MedicationsRecordDocumentEquality();

  @override
  bool equals(MedicationsRecord? e1, MedicationsRecord? e2) {
    return e1?.nameMedication == e2?.nameMedication &&
        e1?.dateMedication == e2?.dateMedication &&
        e1?.dosage == e2?.dosage &&
        e1?.frequencyInADay == e2?.frequencyInADay &&
        e1?.patient == e2?.patient;
  }

  @override
  int hash(MedicationsRecord? e) => const ListEquality().hash([
        e?.nameMedication,
        e?.dateMedication,
        e?.dosage,
        e?.frequencyInADay,
        e?.patient
      ]);

  @override
  bool isValidKey(Object? o) => o is MedicationsRecord;
}
