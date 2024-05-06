import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PropertiRecord extends FirestoreRecord {
  PropertiRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "BRI" field.
  String? _bri;
  String get bri => _bri ?? '';
  bool hasBri() => _bri != null;

  // "BNI" field.
  String? _bni;
  String get bni => _bni ?? '';
  bool hasBni() => _bni != null;

  // "linkKonfirmasi" field.
  String? _linkKonfirmasi;
  String get linkKonfirmasi => _linkKonfirmasi ?? '';
  bool hasLinkKonfirmasi() => _linkKonfirmasi != null;

  // "definition" field.
  String? _definition;
  String get definition => _definition ?? '';
  bool hasDefinition() => _definition != null;

  // "hakCipta" field.
  String? _hakCipta;
  String get hakCipta => _hakCipta ?? '';
  bool hasHakCipta() => _hakCipta != null;

  // "informasiPembayaran" field.
  String? _informasiPembayaran;
  String get informasiPembayaran => _informasiPembayaran ?? '';
  bool hasInformasiPembayaran() => _informasiPembayaran != null;

  // "ketentuanKeamanan" field.
  String? _ketentuanKeamanan;
  String get ketentuanKeamanan => _ketentuanKeamanan ?? '';
  bool hasKetentuanKeamanan() => _ketentuanKeamanan != null;

  // "produkPelayanan" field.
  String? _produkPelayanan;
  String get produkPelayanan => _produkPelayanan ?? '';
  bool hasProdukPelayanan() => _produkPelayanan != null;

  void _initializeFields() {
    _bri = snapshotData['BRI'] as String?;
    _bni = snapshotData['BNI'] as String?;
    _linkKonfirmasi = snapshotData['linkKonfirmasi'] as String?;
    _definition = snapshotData['definition'] as String?;
    _hakCipta = snapshotData['hakCipta'] as String?;
    _informasiPembayaran = snapshotData['informasiPembayaran'] as String?;
    _ketentuanKeamanan = snapshotData['ketentuanKeamanan'] as String?;
    _produkPelayanan = snapshotData['produkPelayanan'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('properti');

  static Stream<PropertiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PropertiRecord.fromSnapshot(s));

  static Future<PropertiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PropertiRecord.fromSnapshot(s));

  static PropertiRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PropertiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PropertiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PropertiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PropertiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PropertiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPropertiRecordData({
  String? bri,
  String? bni,
  String? linkKonfirmasi,
  String? definition,
  String? hakCipta,
  String? informasiPembayaran,
  String? ketentuanKeamanan,
  String? produkPelayanan,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'BRI': bri,
      'BNI': bni,
      'linkKonfirmasi': linkKonfirmasi,
      'definition': definition,
      'hakCipta': hakCipta,
      'informasiPembayaran': informasiPembayaran,
      'ketentuanKeamanan': ketentuanKeamanan,
      'produkPelayanan': produkPelayanan,
    }.withoutNulls,
  );

  return firestoreData;
}

class PropertiRecordDocumentEquality implements Equality<PropertiRecord> {
  const PropertiRecordDocumentEquality();

  @override
  bool equals(PropertiRecord? e1, PropertiRecord? e2) {
    return e1?.bri == e2?.bri &&
        e1?.bni == e2?.bni &&
        e1?.linkKonfirmasi == e2?.linkKonfirmasi &&
        e1?.definition == e2?.definition &&
        e1?.hakCipta == e2?.hakCipta &&
        e1?.informasiPembayaran == e2?.informasiPembayaran &&
        e1?.ketentuanKeamanan == e2?.ketentuanKeamanan &&
        e1?.produkPelayanan == e2?.produkPelayanan;
  }

  @override
  int hash(PropertiRecord? e) => const ListEquality().hash([
        e?.bri,
        e?.bni,
        e?.linkKonfirmasi,
        e?.definition,
        e?.hakCipta,
        e?.informasiPembayaran,
        e?.ketentuanKeamanan,
        e?.produkPelayanan
      ]);

  @override
  bool isValidKey(Object? o) => o is PropertiRecord;
}
