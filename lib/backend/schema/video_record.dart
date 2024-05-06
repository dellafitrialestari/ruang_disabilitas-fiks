import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoRecord extends FirestoreRecord {
  VideoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "judul" field.
  String? _judul;
  String get judul => _judul ?? '';
  bool hasJudul() => _judul != null;

  // "channel" field.
  String? _channel;
  String get channel => _channel ?? '';
  bool hasChannel() => _channel != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "connect" field.
  String? _connect;
  String get connect => _connect ?? '';
  bool hasConnect() => _connect != null;

  void _initializeFields() {
    _judul = snapshotData['judul'] as String?;
    _channel = snapshotData['channel'] as String?;
    _link = snapshotData['link'] as String?;
    _connect = snapshotData['connect'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('video');

  static Stream<VideoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideoRecord.fromSnapshot(s));

  static Future<VideoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideoRecord.fromSnapshot(s));

  static VideoRecord fromSnapshot(DocumentSnapshot snapshot) => VideoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideoRecordData({
  String? judul,
  String? channel,
  String? link,
  String? connect,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'judul': judul,
      'channel': channel,
      'link': link,
      'connect': connect,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideoRecordDocumentEquality implements Equality<VideoRecord> {
  const VideoRecordDocumentEquality();

  @override
  bool equals(VideoRecord? e1, VideoRecord? e2) {
    return e1?.judul == e2?.judul &&
        e1?.channel == e2?.channel &&
        e1?.link == e2?.link &&
        e1?.connect == e2?.connect;
  }

  @override
  int hash(VideoRecord? e) =>
      const ListEquality().hash([e?.judul, e?.channel, e?.link, e?.connect]);

  @override
  bool isValidKey(Object? o) => o is VideoRecord;
}
