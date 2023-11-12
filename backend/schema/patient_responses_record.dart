import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PatientResponsesRecord extends FirestoreRecord {
  PatientResponsesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "whichQuestionnaire" field.
  DocumentReference? _whichQuestionnaire;
  DocumentReference? get whichQuestionnaire => _whichQuestionnaire;
  bool hasWhichQuestionnaire() => _whichQuestionnaire != null;

  // "respondent" field.
  DocumentReference? _respondent;
  DocumentReference? get respondent => _respondent;
  bool hasRespondent() => _respondent != null;

  // "submitted_at" field.
  DateTime? _submittedAt;
  DateTime? get submittedAt => _submittedAt;
  bool hasSubmittedAt() => _submittedAt != null;

  // "answers" field.
  List<String>? _answers;
  List<String> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  // "total_score" field.
  int? _totalScore;
  int get totalScore => _totalScore ?? 0;
  bool hasTotalScore() => _totalScore != null;

  void _initializeFields() {
    _whichQuestionnaire =
        snapshotData['whichQuestionnaire'] as DocumentReference?;
    _respondent = snapshotData['respondent'] as DocumentReference?;
    _submittedAt = snapshotData['submitted_at'] as DateTime?;
    _answers = getDataList(snapshotData['answers']);
    _totalScore = castToType<int>(snapshotData['total_score']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('patientResponses');

  static Stream<PatientResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PatientResponsesRecord.fromSnapshot(s));

  static Future<PatientResponsesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PatientResponsesRecord.fromSnapshot(s));

  static PatientResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PatientResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PatientResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PatientResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PatientResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PatientResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPatientResponsesRecordData({
  DocumentReference? whichQuestionnaire,
  DocumentReference? respondent,
  DateTime? submittedAt,
  int? totalScore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'whichQuestionnaire': whichQuestionnaire,
      'respondent': respondent,
      'submitted_at': submittedAt,
      'total_score': totalScore,
    }.withoutNulls,
  );

  return firestoreData;
}

class PatientResponsesRecordDocumentEquality
    implements Equality<PatientResponsesRecord> {
  const PatientResponsesRecordDocumentEquality();

  @override
  bool equals(PatientResponsesRecord? e1, PatientResponsesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.whichQuestionnaire == e2?.whichQuestionnaire &&
        e1?.respondent == e2?.respondent &&
        e1?.submittedAt == e2?.submittedAt &&
        listEquality.equals(e1?.answers, e2?.answers) &&
        e1?.totalScore == e2?.totalScore;
  }

  @override
  int hash(PatientResponsesRecord? e) => const ListEquality().hash([
        e?.whichQuestionnaire,
        e?.respondent,
        e?.submittedAt,
        e?.answers,
        e?.totalScore
      ]);

  @override
  bool isValidKey(Object? o) => o is PatientResponsesRecord;
}
