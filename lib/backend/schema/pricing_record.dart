import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PricingRecord extends FirestoreRecord {
  PricingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fiturGold1" field.
  String? _fiturGold1;
  String get fiturGold1 => _fiturGold1 ?? '';
  bool hasFiturGold1() => _fiturGold1 != null;

  // "fiturGold2" field.
  String? _fiturGold2;
  String get fiturGold2 => _fiturGold2 ?? '';
  bool hasFiturGold2() => _fiturGold2 != null;

  // "fiturGold3" field.
  String? _fiturGold3;
  String get fiturGold3 => _fiturGold3 ?? '';
  bool hasFiturGold3() => _fiturGold3 != null;

  // "fiturGold4" field.
  String? _fiturGold4;
  String get fiturGold4 => _fiturGold4 ?? '';
  bool hasFiturGold4() => _fiturGold4 != null;

  // "fiturGold5" field.
  String? _fiturGold5;
  String get fiturGold5 => _fiturGold5 ?? '';
  bool hasFiturGold5() => _fiturGold5 != null;

  // "fiturReguler1" field.
  String? _fiturReguler1;
  String get fiturReguler1 => _fiturReguler1 ?? '';
  bool hasFiturReguler1() => _fiturReguler1 != null;

  // "fiturReguler2" field.
  String? _fiturReguler2;
  String get fiturReguler2 => _fiturReguler2 ?? '';
  bool hasFiturReguler2() => _fiturReguler2 != null;

  // "fiturReguler3" field.
  String? _fiturReguler3;
  String get fiturReguler3 => _fiturReguler3 ?? '';
  bool hasFiturReguler3() => _fiturReguler3 != null;

  // "fiturSilver1" field.
  String? _fiturSilver1;
  String get fiturSilver1 => _fiturSilver1 ?? '';
  bool hasFiturSilver1() => _fiturSilver1 != null;

  // "fiturSilver2" field.
  String? _fiturSilver2;
  String get fiturSilver2 => _fiturSilver2 ?? '';
  bool hasFiturSilver2() => _fiturSilver2 != null;

  // "fiturSilver3" field.
  String? _fiturSilver3;
  String get fiturSilver3 => _fiturSilver3 ?? '';
  bool hasFiturSilver3() => _fiturSilver3 != null;

  // "hargaG" field.
  String? _hargaG;
  String get hargaG => _hargaG ?? '';
  bool hasHargaG() => _hargaG != null;

  // "hargaR" field.
  String? _hargaR;
  String get hargaR => _hargaR ?? '';
  bool hasHargaR() => _hargaR != null;

  // "hargaS" field.
  String? _hargaS;
  String get hargaS => _hargaS ?? '';
  bool hasHargaS() => _hargaS != null;

  void _initializeFields() {
    _fiturGold1 = snapshotData['fiturGold1'] as String?;
    _fiturGold2 = snapshotData['fiturGold2'] as String?;
    _fiturGold3 = snapshotData['fiturGold3'] as String?;
    _fiturGold4 = snapshotData['fiturGold4'] as String?;
    _fiturGold5 = snapshotData['fiturGold5'] as String?;
    _fiturReguler1 = snapshotData['fiturReguler1'] as String?;
    _fiturReguler2 = snapshotData['fiturReguler2'] as String?;
    _fiturReguler3 = snapshotData['fiturReguler3'] as String?;
    _fiturSilver1 = snapshotData['fiturSilver1'] as String?;
    _fiturSilver2 = snapshotData['fiturSilver2'] as String?;
    _fiturSilver3 = snapshotData['fiturSilver3'] as String?;
    _hargaG = snapshotData['hargaG'] as String?;
    _hargaR = snapshotData['hargaR'] as String?;
    _hargaS = snapshotData['hargaS'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pricing');

  static Stream<PricingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PricingRecord.fromSnapshot(s));

  static Future<PricingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PricingRecord.fromSnapshot(s));

  static PricingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PricingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PricingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PricingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PricingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PricingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPricingRecordData({
  String? fiturGold1,
  String? fiturGold2,
  String? fiturGold3,
  String? fiturGold4,
  String? fiturGold5,
  String? fiturReguler1,
  String? fiturReguler2,
  String? fiturReguler3,
  String? fiturSilver1,
  String? fiturSilver2,
  String? fiturSilver3,
  String? hargaG,
  String? hargaR,
  String? hargaS,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fiturGold1': fiturGold1,
      'fiturGold2': fiturGold2,
      'fiturGold3': fiturGold3,
      'fiturGold4': fiturGold4,
      'fiturGold5': fiturGold5,
      'fiturReguler1': fiturReguler1,
      'fiturReguler2': fiturReguler2,
      'fiturReguler3': fiturReguler3,
      'fiturSilver1': fiturSilver1,
      'fiturSilver2': fiturSilver2,
      'fiturSilver3': fiturSilver3,
      'hargaG': hargaG,
      'hargaR': hargaR,
      'hargaS': hargaS,
    }.withoutNulls,
  );

  return firestoreData;
}

class PricingRecordDocumentEquality implements Equality<PricingRecord> {
  const PricingRecordDocumentEquality();

  @override
  bool equals(PricingRecord? e1, PricingRecord? e2) {
    return e1?.fiturGold1 == e2?.fiturGold1 &&
        e1?.fiturGold2 == e2?.fiturGold2 &&
        e1?.fiturGold3 == e2?.fiturGold3 &&
        e1?.fiturGold4 == e2?.fiturGold4 &&
        e1?.fiturGold5 == e2?.fiturGold5 &&
        e1?.fiturReguler1 == e2?.fiturReguler1 &&
        e1?.fiturReguler2 == e2?.fiturReguler2 &&
        e1?.fiturReguler3 == e2?.fiturReguler3 &&
        e1?.fiturSilver1 == e2?.fiturSilver1 &&
        e1?.fiturSilver2 == e2?.fiturSilver2 &&
        e1?.fiturSilver3 == e2?.fiturSilver3 &&
        e1?.hargaG == e2?.hargaG &&
        e1?.hargaR == e2?.hargaR &&
        e1?.hargaS == e2?.hargaS;
  }

  @override
  int hash(PricingRecord? e) => const ListEquality().hash([
        e?.fiturGold1,
        e?.fiturGold2,
        e?.fiturGold3,
        e?.fiturGold4,
        e?.fiturGold5,
        e?.fiturReguler1,
        e?.fiturReguler2,
        e?.fiturReguler3,
        e?.fiturSilver1,
        e?.fiturSilver2,
        e?.fiturSilver3,
        e?.hargaG,
        e?.hargaR,
        e?.hargaS
      ]);

  @override
  bool isValidKey(Object? o) => o is PricingRecord;
}
