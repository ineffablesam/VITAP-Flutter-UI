import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'mainpage_notice_record.g.dart';

abstract class MainpageNoticeRecord
    implements Built<MainpageNoticeRecord, MainpageNoticeRecordBuilder> {
  static Serializer<MainpageNoticeRecord> get serializer =>
      _$mainpageNoticeRecordSerializer;

  String? get title;

  String? get message;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MainpageNoticeRecordBuilder builder) => builder
    ..title = ''
    ..message = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mainpage_notice');

  static Stream<MainpageNoticeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MainpageNoticeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MainpageNoticeRecord._();
  factory MainpageNoticeRecord(
          [void Function(MainpageNoticeRecordBuilder) updates]) =
      _$MainpageNoticeRecord;

  static MainpageNoticeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMainpageNoticeRecordData({
  String? title,
  String? message,
}) {
  final firestoreData = serializers.toFirestore(
    MainpageNoticeRecord.serializer,
    MainpageNoticeRecord(
      (m) => m
        ..title = title
        ..message = message,
    ),
  );

  return firestoreData;
}
