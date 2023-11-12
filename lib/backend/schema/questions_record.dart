import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsRecord extends FirestoreRecord {
  QuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question_text" field.
  String? _questionText;
  String get questionText => _questionText ?? '';
  bool hasQuestionText() => _questionText != null;

  // "options" field.
  List<DocumentReference>? _options;
  List<DocumentReference> get options => _options ?? const [];
  bool hasOptions() => _options != null;

  // "created_atQs" field.
  DateTime? _createdAtQs;
  DateTime? get createdAtQs => _createdAtQs;
  bool hasCreatedAtQs() => _createdAtQs != null;

  // "updated_atQs" field.
  DateTime? _updatedAtQs;
  DateTime? get updatedAtQs => _updatedAtQs;
  bool hasUpdatedAtQs() => _updatedAtQs != null;

  void _initializeFields() {
    _questionText = snapshotData['question_text'] as String?;
    _options = getDataList(snapshotData['options']);
    _createdAtQs = snapshotData['created_atQs'] as DateTime?;
    _updatedAtQs = snapshotData['updated_atQs'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('questions');

  static Stream<QuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionsRecord.fromSnapshot(s));

  static Future<QuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionsRecord.fromSnapshot(s));

  static QuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionsRecordData({
  String? questionText,
  DateTime? createdAtQs,
  DateTime? updatedAtQs,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question_text': questionText,
      'created_atQs': createdAtQs,
      'updated_atQs': updatedAtQs,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionsRecordDocumentEquality implements Equality<QuestionsRecord> {
  const QuestionsRecordDocumentEquality();

  @override
  bool equals(QuestionsRecord? e1, QuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.questionText == e2?.questionText &&
        listEquality.equals(e1?.options, e2?.options) &&
        e1?.createdAtQs == e2?.createdAtQs &&
        e1?.updatedAtQs == e2?.updatedAtQs;
  }

  @override
  int hash(QuestionsRecord? e) => const ListEquality()
      .hash([e?.questionText, e?.options, e?.createdAtQs, e?.updatedAtQs]);

  @override
  bool isValidKey(Object? o) => o is QuestionsRecord;
}
