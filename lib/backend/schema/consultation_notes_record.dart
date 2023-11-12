import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConsultationNotesRecord extends FirestoreRecord {
  ConsultationNotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titleNote" field.
  String? _titleNote;
  String get titleNote => _titleNote ?? '';
  bool hasTitleNote() => _titleNote != null;

  // "descNote" field.
  String? _descNote;
  String get descNote => _descNote ?? '';
  bool hasDescNote() => _descNote != null;

  // "writtenTime" field.
  DateTime? _writtenTime;
  DateTime? get writtenTime => _writtenTime;
  bool hasWrittenTime() => _writtenTime != null;

  // "createdForPatient" field.
  DocumentReference? _createdForPatient;
  DocumentReference? get createdForPatient => _createdForPatient;
  bool hasCreatedForPatient() => _createdForPatient != null;

  void _initializeFields() {
    _titleNote = snapshotData['titleNote'] as String?;
    _descNote = snapshotData['descNote'] as String?;
    _writtenTime = snapshotData['writtenTime'] as DateTime?;
    _createdForPatient =
        snapshotData['createdForPatient'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('consultationNotes');

  static Stream<ConsultationNotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConsultationNotesRecord.fromSnapshot(s));

  static Future<ConsultationNotesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ConsultationNotesRecord.fromSnapshot(s));

  static ConsultationNotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConsultationNotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConsultationNotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConsultationNotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConsultationNotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConsultationNotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConsultationNotesRecordData({
  String? titleNote,
  String? descNote,
  DateTime? writtenTime,
  DocumentReference? createdForPatient,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titleNote': titleNote,
      'descNote': descNote,
      'writtenTime': writtenTime,
      'createdForPatient': createdForPatient,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConsultationNotesRecordDocumentEquality
    implements Equality<ConsultationNotesRecord> {
  const ConsultationNotesRecordDocumentEquality();

  @override
  bool equals(ConsultationNotesRecord? e1, ConsultationNotesRecord? e2) {
    return e1?.titleNote == e2?.titleNote &&
        e1?.descNote == e2?.descNote &&
        e1?.writtenTime == e2?.writtenTime &&
        e1?.createdForPatient == e2?.createdForPatient;
  }

  @override
  int hash(ConsultationNotesRecord? e) => const ListEquality()
      .hash([e?.titleNote, e?.descNote, e?.writtenTime, e?.createdForPatient]);

  @override
  bool isValidKey(Object? o) => o is ConsultationNotesRecord;
}
