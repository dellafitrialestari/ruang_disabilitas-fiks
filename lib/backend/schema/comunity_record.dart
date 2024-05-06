import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComunityRecord extends FirestoreRecord {
  ComunityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nama" field.
  String? _nama;
  String get nama => _nama ?? '';
  bool hasNama() => _nama != null;

  // "deskripsi" field.
  String? _deskripsi;
  String get deskripsi => _deskripsi ?? '';
  bool hasDeskripsi() => _deskripsi != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _nama = snapshotData['nama'] as String?;
    _deskripsi = snapshotData['deskripsi'] as String?;
    _link = snapshotData['link'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comunity');

  static Stream<ComunityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComunityRecord.fromSnapshot(s));

  static Future<ComunityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ComunityRecord.fromSnapshot(s));

  static ComunityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComunityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComunityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComunityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComunityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComunityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComunityRecordData({
  String? nama,
  String? deskripsi,
  String? link,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nama': nama,
      'deskripsi': deskripsi,
      'link': link,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComunityRecordDocumentEquality implements Equality<ComunityRecord> {
  const ComunityRecordDocumentEquality();

  @override
  bool equals(ComunityRecord? e1, ComunityRecord? e2) {
    return e1?.nama == e2?.nama &&
        e1?.deskripsi == e2?.deskripsi &&
        e1?.link == e2?.link &&
        e1?.image == e2?.image;
  }

  @override
  int hash(ComunityRecord? e) =>
      const ListEquality().hash([e?.nama, e?.deskripsi, e?.link, e?.image]);

  @override
  bool isValidKey(Object? o) => o is ComunityRecord;
}
