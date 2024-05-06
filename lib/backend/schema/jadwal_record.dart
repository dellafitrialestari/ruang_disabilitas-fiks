import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JadwalRecord extends FirestoreRecord {
  JadwalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "jam" field.
  String? _jam;
  String get jam => _jam ?? '';
  bool hasJam() => _jam != null;

  // "hari" field.
  String? _hari;
  String get hari => _hari ?? '';
  bool hasHari() => _hari != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _jam = snapshotData['jam'] as String?;
    _hari = snapshotData['hari'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('jadwal')
          : FirebaseFirestore.instance.collectionGroup('jadwal');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('jadwal').doc();

  static Stream<JadwalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JadwalRecord.fromSnapshot(s));

  static Future<JadwalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JadwalRecord.fromSnapshot(s));

  static JadwalRecord fromSnapshot(DocumentSnapshot snapshot) => JadwalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JadwalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JadwalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JadwalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JadwalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJadwalRecordData({
  String? jam,
  String? hari,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'jam': jam,
      'hari': hari,
    }.withoutNulls,
  );

  return firestoreData;
}

class JadwalRecordDocumentEquality implements Equality<JadwalRecord> {
  const JadwalRecordDocumentEquality();

  @override
  bool equals(JadwalRecord? e1, JadwalRecord? e2) {
    return e1?.jam == e2?.jam && e1?.hari == e2?.hari;
  }

  @override
  int hash(JadwalRecord? e) => const ListEquality().hash([e?.jam, e?.hari]);

  @override
  bool isValidKey(Object? o) => o is JadwalRecord;
}
