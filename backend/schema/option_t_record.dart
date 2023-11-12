import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OptionTRecord extends FirestoreRecord {
  OptionTRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "option_id" field.
  String? _optionId;
  String get optionId => _optionId ?? '';
  bool hasOptionId() => _optionId != null;

  // "option_desc" field.
  String? _optionDesc;
  String get optionDesc => _optionDesc ?? '';
  bool hasOptionDesc() => _optionDesc != null;

  // "option_score" field.
  int? _optionScore;
  int get optionScore => _optionScore ?? 0;
  bool hasOptionScore() => _optionScore != null;

  // "question_id" field.
  String? _questionId;
  String get questionId => _questionId ?? '';
  bool hasQuestionId() => _questionId != null;

  void _initializeFields() {
    _optionId = snapshotData['option_id'] as String?;
    _optionDesc = snapshotData['option_desc'] as String?;
    _optionScore = castToType<int>(snapshotData['option_score']);
    _questionId = snapshotData['question_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('optionT');

  static Stream<OptionTRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OptionTRecord.fromSnapshot(s));

  static Future<OptionTRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OptionTRecord.fromSnapshot(s));

  static OptionTRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OptionTRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OptionTRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OptionTRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OptionTRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OptionTRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOptionTRecordData({
  String? optionId,
  String? optionDesc,
  int? optionScore,
  String? questionId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'option_id': optionId,
      'option_desc': optionDesc,
      'option_score': optionScore,
      'question_id': questionId,
    }.withoutNulls,
  );

  return firestoreData;
}

class OptionTRecordDocumentEquality implements Equality<OptionTRecord> {
  const OptionTRecordDocumentEquality();

  @override
  bool equals(OptionTRecord? e1, OptionTRecord? e2) {
    return e1?.optionId == e2?.optionId &&
        e1?.optionDesc == e2?.optionDesc &&
        e1?.optionScore == e2?.optionScore &&
        e1?.questionId == e2?.questionId;
  }

  @override
  int hash(OptionTRecord? e) => const ListEquality()
      .hash([e?.optionId, e?.optionDesc, e?.optionScore, e?.questionId]);

  @override
  bool isValidKey(Object? o) => o is OptionTRecord;
}
