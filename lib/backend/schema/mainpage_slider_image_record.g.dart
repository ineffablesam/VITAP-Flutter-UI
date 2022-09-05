// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mainpage_slider_image_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MainpageSliderImageRecord> _$mainpageSliderImageRecordSerializer =
    new _$MainpageSliderImageRecordSerializer();

class _$MainpageSliderImageRecordSerializer
    implements StructuredSerializer<MainpageSliderImageRecord> {
  @override
  final Iterable<Type> types = const [
    MainpageSliderImageRecord,
    _$MainpageSliderImageRecord
  ];
  @override
  final String wireName = 'MainpageSliderImageRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MainpageSliderImageRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('image_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  MainpageSliderImageRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MainpageSliderImageRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'image_url':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$MainpageSliderImageRecord extends MainpageSliderImageRecord {
  @override
  final String? imageUrl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MainpageSliderImageRecord(
          [void Function(MainpageSliderImageRecordBuilder)? updates]) =>
      (new MainpageSliderImageRecordBuilder()..update(updates))._build();

  _$MainpageSliderImageRecord._({this.imageUrl, this.ffRef}) : super._();

  @override
  MainpageSliderImageRecord rebuild(
          void Function(MainpageSliderImageRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainpageSliderImageRecordBuilder toBuilder() =>
      new MainpageSliderImageRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MainpageSliderImageRecord &&
        imageUrl == other.imageUrl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, imageUrl.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MainpageSliderImageRecord')
          ..add('imageUrl', imageUrl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MainpageSliderImageRecordBuilder
    implements
        Builder<MainpageSliderImageRecord, MainpageSliderImageRecordBuilder> {
  _$MainpageSliderImageRecord? _$v;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MainpageSliderImageRecordBuilder() {
    MainpageSliderImageRecord._initializeBuilder(this);
  }

  MainpageSliderImageRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageUrl = $v.imageUrl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MainpageSliderImageRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MainpageSliderImageRecord;
  }

  @override
  void update(void Function(MainpageSliderImageRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MainpageSliderImageRecord build() => _build();

  _$MainpageSliderImageRecord _build() {
    final _$result = _$v ??
        new _$MainpageSliderImageRecord._(imageUrl: imageUrl, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
