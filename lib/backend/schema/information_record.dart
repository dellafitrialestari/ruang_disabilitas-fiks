import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InformationRecord extends FirestoreRecord {
  InformationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "judul" field.
  String? _judul;
  String get judul => _judul ?? '';
  bool hasJudul() => _judul != null;

  // "penulis" field.
  String? _penulis;
  String get penulis => _penulis ?? '';
  bool hasPenulis() => _penulis != null;

  // "tanggal" field.
  String? _tanggal;
  String get tanggal => _tanggal ?? '';
  bool hasTanggal() => _tanggal != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  void _initializeFields() {
    _judul = snapshotData['judul'] as String?;
    _penulis = snapshotData['penulis'] as String?;
    _tanggal = snapshotData['tanggal'] as String?;
    _image = snapshotData['image'] as String?;
    _link = snapshotData['link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('information');

  static Stream<InformationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InformationRecord.fromSnapshot(s));

  static Future<InformationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InformationRecord.fromSnapshot(s));

  static InformationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InformationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InformationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InformationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InformationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InformationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInformationRecordData({
  String? judul,
  String? penulis,
  String? tanggal,
  String? image,
  String? link,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'judul': judul,
      'penulis': penulis,
      'tanggal': tanggal,
      'image': image,
      'link': link,
    }.withoutNulls,
  );

  return firestoreData;
}

class InformationRecordDocumentEquality implements Equality<InformationRecord> {
  const InformationRecordDocumentEquality();

  @override
  bool equals(InformationRecord? e1, InformationRecord? e2) {
    return e1?.judul == e2?.judul &&
        e1?.penulis == e2?.penulis &&
        e1?.tanggal == e2?.tanggal &&
        e1?.image == e2?.image &&
        e1?.link == e2?.link;
  }

  @override
  int hash(InformationRecord? e) => const ListEquality()
      .hash([e?.judul, e?.penulis, e?.tanggal, e?.image, e?.link]);

  @override
  bool isValidKey(Object? o) => o is InformationRecord;
}
