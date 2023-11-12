import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SurveyOptionsRecord extends FirestoreRecord {
  SurveyOptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "option_text" field.
  String? _optionText;
  String get optionText => _optionText ?? '';
  bool hasOptionText() => _optionText != null;

  // "question_id" field.
  String? _questionId;
  String get questionId => _questionId ?? '';
  bool hasQuestionId() => _questionId != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  // "respondent" field.
  DocumentReference? _respondent;
  DocumentReference? get respondent => _respondent;
  bool hasRespondent() => _respondent != null;

  // "submitted_at" field.
  DateTime? _submittedAt;
  DateTime? get submittedAt => _submittedAt;
  bool hasSubmittedAt() => _submittedAt != null;

  void _initializeFields() {
    _optionText = snapshotData['option_text'] as String?;
    _questionId = snapshotData['question_id'] as String?;
    _score = castToType<int>(snapshotData['score']);
    _respondent = snapshotData['respondent'] as DocumentReference?;
    _submittedAt = snapshotData['submitted_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('surveyOptions');

  static Stream<SurveyOptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SurveyOptionsRecord.fromSnapshot(s));

  static Future<SurveyOptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SurveyOptionsRecord.fromSnapshot(s));

  static SurveyOptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SurveyOptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SurveyOptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SurveyOptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SurveyOptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SurveyOptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSurveyOptionsRecordData({
  String? optionText,
  String? questionId,
  int? score,
  DocumentReference? respondent,
  DateTime? submittedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'option_text': optionText,
      'question_id': questionId,
      'score': score,
      'respondent': respondent,
      'submitted_at': submittedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class SurveyOptionsRecordDocumentEquality
    implements Equality<SurveyOptionsRecord> {
  const SurveyOptionsRecordDocumentEquality();

  @override
  bool equals(SurveyOptionsRecord? e1, SurveyOptionsRecord? e2) {
    return e1?.optionText == e2?.optionText &&
        e1?.questionId == e2?.questionId &&
        e1?.score == e2?.score &&
        e1?.respondent == e2?.respondent &&
        e1?.submittedAt == e2?.submittedAt;
  }

  @override
  int hash(SurveyOptionsRecord? e) => const ListEquality().hash(
      [e?.optionText, e?.questionId, e?.score, e?.respondent, e?.submittedAt]);

  @override
  bool isValidKey(Object? o) => o is SurveyOptionsRecord;
}
