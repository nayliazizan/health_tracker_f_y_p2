import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionTRecord extends FirestoreRecord {
  QuestionTRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question_id" field.
  String? _questionId;
  String get questionId => _questionId ?? '';
  bool hasQuestionId() => _questionId != null;

  // "question_desc" field.
  String? _questionDesc;
  String get questionDesc => _questionDesc ?? '';
  bool hasQuestionDesc() => _questionDesc != null;

  void _initializeFields() {
    _questionId = snapshotData['question_id'] as String?;
    _questionDesc = snapshotData['question_desc'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('questionT');

  static Stream<QuestionTRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionTRecord.fromSnapshot(s));

  static Future<QuestionTRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionTRecord.fromSnapshot(s));

  static QuestionTRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionTRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionTRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionTRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionTRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionTRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionTRecordData({
  String? questionId,
  String? questionDesc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question_id': questionId,
      'question_desc': questionDesc,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionTRecordDocumentEquality implements Equality<QuestionTRecord> {
  const QuestionTRecordDocumentEquality();

  @override
  bool equals(QuestionTRecord? e1, QuestionTRecord? e2) {
    return e1?.questionId == e2?.questionId &&
        e1?.questionDesc == e2?.questionDesc;
  }

  @override
  int hash(QuestionTRecord? e) =>
      const ListEquality().hash([e?.questionId, e?.questionDesc]);

  @override
  bool isValidKey(Object? o) => o is QuestionTRecord;
}
