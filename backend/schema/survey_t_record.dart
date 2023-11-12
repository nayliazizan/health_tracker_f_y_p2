import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SurveyTRecord extends FirestoreRecord {
  SurveyTRecord._(
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

  // "total_score" field.
  int? _totalScore;
  int get totalScore => _totalScore ?? 0;
  bool hasTotalScore() => _totalScore != null;

  void _initializeFields() {
    _respondent = snapshotData['respondent'] as DocumentReference?;
    _submittedAt = snapshotData['submitted_at'] as DateTime?;
    _totalScore = castToType<int>(snapshotData['total_score']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('surveyT');

  static Stream<SurveyTRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SurveyTRecord.fromSnapshot(s));

  static Future<SurveyTRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SurveyTRecord.fromSnapshot(s));

  static SurveyTRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SurveyTRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SurveyTRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SurveyTRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SurveyTRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SurveyTRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSurveyTRecordData({
  DocumentReference? respondent,
  DateTime? submittedAt,
  int? totalScore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'respondent': respondent,
      'submitted_at': submittedAt,
      'total_score': totalScore,
    }.withoutNulls,
  );

  return firestoreData;
}

class SurveyTRecordDocumentEquality implements Equality<SurveyTRecord> {
  const SurveyTRecordDocumentEquality();

  @override
  bool equals(SurveyTRecord? e1, SurveyTRecord? e2) {
    return e1?.respondent == e2?.respondent &&
        e1?.submittedAt == e2?.submittedAt &&
        e1?.totalScore == e2?.totalScore;
  }

  @override
  int hash(SurveyTRecord? e) =>
      const ListEquality().hash([e?.respondent, e?.submittedAt, e?.totalScore]);

  @override
  bool isValidKey(Object? o) => o is SurveyTRecord;
}
