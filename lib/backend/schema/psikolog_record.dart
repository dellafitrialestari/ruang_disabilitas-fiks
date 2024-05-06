import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PsikologRecord extends FirestoreRecord {
  PsikologRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description1" field.
  String? _description1;
  String get description1 => _description1 ?? '';
  bool hasDescription1() => _description1 != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "linkCall" field.
  String? _linkCall;
  String get linkCall => _linkCall ?? '';
  bool hasLinkCall() => _linkCall != null;

  // "linkChat" field.
  String? _linkChat;
  String get linkChat => _linkChat ?? '';
  bool hasLinkChat() => _linkChat != null;

  // "linkVideo" field.
  String? _linkVideo;
  String get linkVideo => _linkVideo ?? '';
  bool hasLinkVideo() => _linkVideo != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description1 = snapshotData['description1'] as String?;
    _image = snapshotData['image'] as String?;
    _detail = snapshotData['detail'] as String?;
    _linkCall = snapshotData['linkCall'] as String?;
    _linkChat = snapshotData['linkChat'] as String?;
    _linkVideo = snapshotData['linkVideo'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('psikolog');

  static Stream<PsikologRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PsikologRecord.fromSnapshot(s));

  static Future<PsikologRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PsikologRecord.fromSnapshot(s));

  static PsikologRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PsikologRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PsikologRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PsikologRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PsikologRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PsikologRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPsikologRecordData({
  String? name,
  String? description1,
  String? image,
  String? detail,
  String? linkCall,
  String? linkChat,
  String? linkVideo,
  double? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description1': description1,
      'image': image,
      'detail': detail,
      'linkCall': linkCall,
      'linkChat': linkChat,
      'linkVideo': linkVideo,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class PsikologRecordDocumentEquality implements Equality<PsikologRecord> {
  const PsikologRecordDocumentEquality();

  @override
  bool equals(PsikologRecord? e1, PsikologRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description1 == e2?.description1 &&
        e1?.image == e2?.image &&
        e1?.detail == e2?.detail &&
        e1?.linkCall == e2?.linkCall &&
        e1?.linkChat == e2?.linkChat &&
        e1?.linkVideo == e2?.linkVideo &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(PsikologRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description1,
        e?.image,
        e?.detail,
        e?.linkCall,
        e?.linkChat,
        e?.linkVideo,
        e?.rating
      ]);

  @override
  bool isValidKey(Object? o) => o is PsikologRecord;
}
