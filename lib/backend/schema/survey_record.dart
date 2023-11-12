import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SurveyRecord extends FirestoreRecord {
  SurveyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "respondent" field.
  DocumentReference? _respondent;
  DocumentReference? get respondent => _respondent;
  bool hasRespondent() => _respondent != null;

  // "submitted_at" field.
  DateTime? _submittedAt;
  DateTime? get submittedAt => _submittedAt;
  bool hasSubmittedAt() => _submittedAt != null;

  // "question1" field.
  DocumentReference? _question1;
  DocumentReference? get question1 => _question1;
  bool hasQuestion1() => _question1 != null;

  // "question2" field.
  DocumentReference? _question2;
  DocumentReference? get question2 => _question2;
  bool hasQuestion2() => _question2 != null;

  // "total_score" field.
  int? _totalScore;
  int get totalScore => _totalScore ?? 0;
  bool hasTotalScore() => _totalScore != null;

  void _initializeFields() {
    _respondent = snapshotData['respondent'] as DocumentReference?;
    _submittedAt = snapshotData['submitted_at'] as DateTime?;
    _question1 = snapshotData['question1'] as DocumentReference?;
    _question2 = snapshotData['question2'] as DocumentReference?;
    _totalScore = castToType<int>(snapshotData['total_score']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('survey');

  static Stream<SurveyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SurveyRecord.fromSnapshot(s));

  static Future<SurveyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SurveyRecord.fromSnapshot(s));

  static SurveyRecord fromSnapshot(DocumentSnapshot snapshot) => SurveyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SurveyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SurveyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SurveyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SurveyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSurveyRecordData({
  DocumentReference? respondent,
  DateTime? submittedAt,
  DocumentReference? question1,
  DocumentReference? question2,
  int? totalScore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'respondent': respondent,
      'submitted_at': submittedAt,
      'question1': question1,
      'question2': question2,
      'total_score': totalScore,
    }.withoutNulls,
  );

  return firestoreData;
}

class SurveyRecordDocumentEquality implements Equality<SurveyRecord> {
  const SurveyRecordDocumentEquality();

  @override
  bool equals(SurveyRecord? e1, SurveyRecord? e2) {
    return e1?.respondent == e2?.respondent &&
        e1?.submittedAt == e2?.submittedAt &&
        e1?.question1 == e2?.question1 &&
        e1?.question2 == e2?.question2 &&
        e1?.totalScore == e2?.totalScore;
  }

  @override
  int hash(SurveyRecord? e) => const ListEquality().hash([
        e?.respondent,
        e?.submittedAt,
        e?.question1,
        e?.question2,
        e?.totalScore
      ]);

  @override
  bool isValidKey(Object? o) => o is SurveyRecord;
}
