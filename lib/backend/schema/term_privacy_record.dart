import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TermPrivacyRecord extends FirestoreRecord {
  TermPrivacyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "linkPrivacy" field.
  String? _linkPrivacy;
  String get linkPrivacy => _linkPrivacy ?? '';
  bool hasLinkPrivacy() => _linkPrivacy != null;

  // "linkTerm" field.
  String? _linkTerm;
  String get linkTerm => _linkTerm ?? '';
  bool hasLinkTerm() => _linkTerm != null;

  void _initializeFields() {
    _linkPrivacy = snapshotData['linkPrivacy'] as String?;
    _linkTerm = snapshotData['linkTerm'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('termPrivacy');

  static Stream<TermPrivacyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TermPrivacyRecord.fromSnapshot(s));

  static Future<TermPrivacyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TermPrivacyRecord.fromSnapshot(s));

  static TermPrivacyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TermPrivacyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TermPrivacyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TermPrivacyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TermPrivacyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TermPrivacyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTermPrivacyRecordData({
  String? linkPrivacy,
  String? linkTerm,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'linkPrivacy': linkPrivacy,
      'linkTerm': linkTerm,
    }.withoutNulls,
  );

  return firestoreData;
}

class TermPrivacyRecordDocumentEquality implements Equality<TermPrivacyRecord> {
  const TermPrivacyRecordDocumentEquality();

  @override
  bool equals(TermPrivacyRecord? e1, TermPrivacyRecord? e2) {
    return e1?.linkPrivacy == e2?.linkPrivacy && e1?.linkTerm == e2?.linkTerm;
  }

  @override
  int hash(TermPrivacyRecord? e) =>
      const ListEquality().hash([e?.linkPrivacy, e?.linkTerm]);

  @override
  bool isValidKey(Object? o) => o is TermPrivacyRecord;
}
