import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OptionsRecord extends FirestoreRecord {
  OptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "option_text" field.
  String? _optionText;
  String get optionText => _optionText ?? '';
  bool hasOptionText() => _optionText != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  // "created_atOs" field.
  DateTime? _createdAtOs;
  DateTime? get createdAtOs => _createdAtOs;
  bool hasCreatedAtOs() => _createdAtOs != null;

  // "updated_atOs" field.
  DateTime? _updatedAtOs;
  DateTime? get updatedAtOs => _updatedAtOs;
  bool hasUpdatedAtOs() => _updatedAtOs != null;

  void _initializeFields() {
    _optionText = snapshotData['option_text'] as String?;
    _score = castToType<int>(snapshotData['score']);
    _createdAtOs = snapshotData['created_atOs'] as DateTime?;
    _updatedAtOs = snapshotData['updated_atOs'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('options');

  static Stream<OptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OptionsRecord.fromSnapshot(s));

  static Future<OptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OptionsRecord.fromSnapshot(s));

  static OptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOptionsRecordData({
  String? optionText,
  int? score,
  DateTime? createdAtOs,
  DateTime? updatedAtOs,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'option_text': optionText,
      'score': score,
      'created_atOs': createdAtOs,
      'updated_atOs': updatedAtOs,
    }.withoutNulls,
  );

  return firestoreData;
}

class OptionsRecordDocumentEquality implements Equality<OptionsRecord> {
  const OptionsRecordDocumentEquality();

  @override
  bool equals(OptionsRecord? e1, OptionsRecord? e2) {
    return e1?.optionText == e2?.optionText &&
        e1?.score == e2?.score &&
        e1?.createdAtOs == e2?.createdAtOs &&
        e1?.updatedAtOs == e2?.updatedAtOs;
  }

  @override
  int hash(OptionsRecord? e) => const ListEquality()
      .hash([e?.optionText, e?.score, e?.createdAtOs, e?.updatedAtOs]);

  @override
  bool isValidKey(Object? o) => o is OptionsRecord;
}
