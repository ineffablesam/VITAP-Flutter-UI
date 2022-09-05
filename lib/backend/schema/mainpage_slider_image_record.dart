import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'mainpage_slider_image_record.g.dart';

abstract class MainpageSliderImageRecord
    implements
        Built<MainpageSliderImageRecord, MainpageSliderImageRecordBuilder> {
  static Serializer<MainpageSliderImageRecord> get serializer =>
      _$mainpageSliderImageRecordSerializer;

  @BuiltValueField(wireName: 'image_url')
  String? get imageUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MainpageSliderImageRecordBuilder builder) =>
      builder..imageUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mainpage_slider_image');

  static Stream<MainpageSliderImageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MainpageSliderImageRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MainpageSliderImageRecord._();
  factory MainpageSliderImageRecord(
          [void Function(MainpageSliderImageRecordBuilder) updates]) =
      _$MainpageSliderImageRecord;

  static MainpageSliderImageRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMainpageSliderImageRecordData({
  String? imageUrl,
}) {
  final firestoreData = serializers.toFirestore(
    MainpageSliderImageRecord.serializer,
    MainpageSliderImageRecord(
      (m) => m..imageUrl = imageUrl,
    ),
  );

  return firestoreData;
}
