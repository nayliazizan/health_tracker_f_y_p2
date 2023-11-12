import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionnairesRecord extends FirestoreRecord {
  QuestionnairesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titleQns" field.
  String? _titleQns;
  String get titleQns => _titleQns ?? '';
  bool hasTitleQns() => _titleQns != null;

  // "descQns" field.
  String? _descQns;
  String get descQns => _descQns ?? '';
  bool hasDescQns() => _descQns != null;

  // "questions" field.
  List<DocumentReference>? _questions;
  List<DocumentReference> get questions => _questions ?? const [];
  bool hasQuestions() => _questions != null;

  // "created_atQns" field.
  DateTime? _createdAtQns;
  DateTime? get createdAtQns => _createdAtQns;
  bool hasCreatedAtQns() => _createdAtQns != null;

  // "updated_atQns" field.
  DateTime? _updatedAtQns;
  DateTime? get updatedAtQns => _updatedAtQns;
  bool hasUpdatedAtQns() => _updatedAtQns != null;

  void _initializeFields() {
    _titleQns = snapshotData['titleQns'] as String?;
    _descQns = snapshotData['descQns'] as String?;
    _questions = getDataList(snapshotData['questions']);
    _createdAtQns = snapshotData['created_atQns'] as DateTime?;
    _updatedAtQns = snapshotData['updated_atQns'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('questionnaires');

  static Stream<QuestionnairesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionnairesRecord.fromSnapshot(s));

  static Future<QuestionnairesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionnairesRecord.fromSnapshot(s));

  static QuestionnairesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionnairesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionnairesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionnairesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionnairesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionnairesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionnairesRecordData({
  String? titleQns,
  String? descQns,
  DateTime? createdAtQns,
  DateTime? updatedAtQns,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titleQns': titleQns,
      'descQns': descQns,
      'created_atQns': createdAtQns,
      'updated_atQns': updatedAtQns,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionnairesRecordDocumentEquality
    implements Equality<QuestionnairesRecord> {
  const QuestionnairesRecordDocumentEquality();

  @override
  bool equals(QuestionnairesRecord? e1, QuestionnairesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.titleQns == e2?.titleQns &&
        e1?.descQns == e2?.descQns &&
        listEquality.equals(e1?.questions, e2?.questions) &&
        e1?.createdAtQns == e2?.createdAtQns &&
        e1?.updatedAtQns == e2?.updatedAtQns;
  }

  @override
  int hash(QuestionnairesRecord? e) => const ListEquality().hash([
        e?.titleQns,
        e?.descQns,
        e?.questions,
        e?.createdAtQns,
        e?.updatedAtQns
      ]);

  @override
  bool isValidKey(Object? o) => o is QuestionnairesRecord;
}
