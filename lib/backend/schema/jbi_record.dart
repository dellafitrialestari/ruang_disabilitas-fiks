import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JbiRecord extends FirestoreRecord {
  JbiRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "deskripsi" field.
  String? _deskripsi;
  String get deskripsi => _deskripsi ?? '';
  bool hasDeskripsi() => _deskripsi != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "nama" field.
  String? _nama;
  String get nama => _nama ?? '';
  bool hasNama() => _nama != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _deskripsi = snapshotData['deskripsi'] as String?;
    _image = snapshotData['image'] as String?;
    _nama = snapshotData['nama'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('JBI')
          : FirebaseFirestore.instance.collectionGroup('JBI');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('JBI').doc();

  static Stream<JbiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JbiRecord.fromSnapshot(s));

  static Future<JbiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JbiRecord.fromSnapshot(s));

  static JbiRecord fromSnapshot(DocumentSnapshot snapshot) => JbiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JbiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JbiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JbiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JbiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJbiRecordData({
  String? deskripsi,
  String? image,
  String? nama,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'deskripsi': deskripsi,
      'image': image,
      'nama': nama,
    }.withoutNulls,
  );

  return firestoreData;
}

class JbiRecordDocumentEquality implements Equality<JbiRecord> {
  const JbiRecordDocumentEquality();

  @override
  bool equals(JbiRecord? e1, JbiRecord? e2) {
    return e1?.deskripsi == e2?.deskripsi &&
        e1?.image == e2?.image &&
        e1?.nama == e2?.nama;
  }

  @override
  int hash(JbiRecord? e) =>
      const ListEquality().hash([e?.deskripsi, e?.image, e?.nama]);

  @override
  bool isValidKey(Object? o) => o is JbiRecord;
}
