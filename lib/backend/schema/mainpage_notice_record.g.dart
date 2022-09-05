// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mainpage_notice_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MainpageNoticeRecord> _$mainpageNoticeRecordSerializer =
    new _$MainpageNoticeRecordSerializer();

class _$MainpageNoticeRecordSerializer
    implements StructuredSerializer<MainpageNoticeRecord> {
  @override
  final Iterable<Type> types = const [
    MainpageNoticeRecord,
    _$MainpageNoticeRecord
  ];
  @override
  final String wireName = 'MainpageNoticeRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MainpageNoticeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
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
  MainpageNoticeRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MainpageNoticeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
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

class _$MainpageNoticeRecord extends MainpageNoticeRecord {
  @override
  final String? title;
  @override
  final String? message;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MainpageNoticeRecord(
          [void Function(MainpageNoticeRecordBuilder)? updates]) =>
      (new MainpageNoticeRecordBuilder()..update(updates))._build();

  _$MainpageNoticeRecord._({this.title, this.message, this.ffRef}) : super._();

  @override
  MainpageNoticeRecord rebuild(
          void Function(MainpageNoticeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainpageNoticeRecordBuilder toBuilder() =>
      new MainpageNoticeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MainpageNoticeRecord &&
        title == other.title &&
        message == other.message &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, title.hashCode), message.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MainpageNoticeRecord')
          ..add('title', title)
          ..add('message', message)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MainpageNoticeRecordBuilder
    implements Builder<MainpageNoticeRecord, MainpageNoticeRecordBuilder> {
  _$MainpageNoticeRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MainpageNoticeRecordBuilder() {
    MainpageNoticeRecord._initializeBuilder(this);
  }

  MainpageNoticeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _message = $v.message;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MainpageNoticeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MainpageNoticeRecord;
  }

  @override
  void update(void Function(MainpageNoticeRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MainpageNoticeRecord build() => _build();

  _$MainpageNoticeRecord _build() {
    final _$result = _$v ??
        new _$MainpageNoticeRecord._(
            title: title, message: message, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
