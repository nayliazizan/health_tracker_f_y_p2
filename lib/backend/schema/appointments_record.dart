import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentsRecord extends FirestoreRecord {
  AppointmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "appointmentName" field.
  String? _appointmentName;
  String get appointmentName => _appointmentName ?? '';
  bool hasAppointmentName() => _appointmentName != null;

  // "appointmentDesc" field.
  String? _appointmentDesc;
  String get appointmentDesc => _appointmentDesc ?? '';
  bool hasAppointmentDesc() => _appointmentDesc != null;

  // "appointmentPerson" field.
  DocumentReference? _appointmentPerson;
  DocumentReference? get appointmentPerson => _appointmentPerson;
  bool hasAppointmentPerson() => _appointmentPerson != null;

  // "appointmentTime" field.
  DateTime? _appointmentTime;
  DateTime? get appointmentTime => _appointmentTime;
  bool hasAppointmentTime() => _appointmentTime != null;

  // "appointmentType" field.
  String? _appointmentType;
  String get appointmentType => _appointmentType ?? '';
  bool hasAppointmentType() => _appointmentType != null;

  void _initializeFields() {
    _appointmentName = snapshotData['appointmentName'] as String?;
    _appointmentDesc = snapshotData['appointmentDesc'] as String?;
    _appointmentPerson =
        snapshotData['appointmentPerson'] as DocumentReference?;
    _appointmentTime = snapshotData['appointmentTime'] as DateTime?;
    _appointmentType = snapshotData['appointmentType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointments');

  static Stream<AppointmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentsRecord.fromSnapshot(s));

  static Future<AppointmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentsRecord.fromSnapshot(s));

  static AppointmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentsRecordData({
  String? appointmentName,
  String? appointmentDesc,
  DocumentReference? appointmentPerson,
  DateTime? appointmentTime,
  String? appointmentType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'appointmentName': appointmentName,
      'appointmentDesc': appointmentDesc,
      'appointmentPerson': appointmentPerson,
      'appointmentTime': appointmentTime,
      'appointmentType': appointmentType,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentsRecordDocumentEquality
    implements Equality<AppointmentsRecord> {
  const AppointmentsRecordDocumentEquality();

  @override
  bool equals(AppointmentsRecord? e1, AppointmentsRecord? e2) {
    return e1?.appointmentName == e2?.appointmentName &&
        e1?.appointmentDesc == e2?.appointmentDesc &&
        e1?.appointmentPerson == e2?.appointmentPerson &&
        e1?.appointmentTime == e2?.appointmentTime &&
        e1?.appointmentType == e2?.appointmentType;
  }

  @override
  int hash(AppointmentsRecord? e) => const ListEquality().hash([
        e?.appointmentName,
        e?.appointmentDesc,
        e?.appointmentPerson,
        e?.appointmentTime,
        e?.appointmentType
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentsRecord;
}
