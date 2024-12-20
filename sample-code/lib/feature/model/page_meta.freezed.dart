// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageMeta _$PageMetaFromJson(Map<String, dynamic> json) {
  return _PageMeta.fromJson(json);
}

/// @nodoc
mixin _$PageMeta {
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'pageable_count')
  int get pageableCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_end')
  bool get isEnd => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageMetaCopyWith<PageMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageMetaCopyWith<$Res> {
  factory $PageMetaCopyWith(PageMeta value, $Res Function(PageMeta) then) =
      _$PageMetaCopyWithImpl<$Res, PageMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'pageable_count') int pageableCount,
      @JsonKey(name: 'is_end') bool isEnd});
}

/// @nodoc
class _$PageMetaCopyWithImpl<$Res, $Val extends PageMeta>
    implements $PageMetaCopyWith<$Res> {
  _$PageMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? pageableCount = null,
    Object? isEnd = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageableCount: null == pageableCount
          ? _value.pageableCount
          : pageableCount // ignore: cast_nullable_to_non_nullable
              as int,
      isEnd: null == isEnd
          ? _value.isEnd
          : isEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageMetaImplCopyWith<$Res>
    implements $PageMetaCopyWith<$Res> {
  factory _$$PageMetaImplCopyWith(
          _$PageMetaImpl value, $Res Function(_$PageMetaImpl) then) =
      __$$PageMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'pageable_count') int pageableCount,
      @JsonKey(name: 'is_end') bool isEnd});
}

/// @nodoc
class __$$PageMetaImplCopyWithImpl<$Res>
    extends _$PageMetaCopyWithImpl<$Res, _$PageMetaImpl>
    implements _$$PageMetaImplCopyWith<$Res> {
  __$$PageMetaImplCopyWithImpl(
      _$PageMetaImpl _value, $Res Function(_$PageMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? pageableCount = null,
    Object? isEnd = null,
  }) {
    return _then(_$PageMetaImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageableCount: null == pageableCount
          ? _value.pageableCount
          : pageableCount // ignore: cast_nullable_to_non_nullable
              as int,
      isEnd: null == isEnd
          ? _value.isEnd
          : isEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$PageMetaImpl implements _PageMeta {
  _$PageMetaImpl(
      {@JsonKey(name: 'total_count') required this.totalCount,
      @JsonKey(name: 'pageable_count') required this.pageableCount,
      @JsonKey(name: 'is_end') required this.isEnd});

  factory _$PageMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageMetaImplFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'pageable_count')
  final int pageableCount;
  @override
  @JsonKey(name: 'is_end')
  final bool isEnd;

  @override
  String toString() {
    return 'PageMeta(totalCount: $totalCount, pageableCount: $pageableCount, isEnd: $isEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageMetaImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.pageableCount, pageableCount) ||
                other.pageableCount == pageableCount) &&
            (identical(other.isEnd, isEnd) || other.isEnd == isEnd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalCount, pageableCount, isEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageMetaImplCopyWith<_$PageMetaImpl> get copyWith =>
      __$$PageMetaImplCopyWithImpl<_$PageMetaImpl>(this, _$identity);
}

abstract class _PageMeta implements PageMeta {
  factory _PageMeta(
      {@JsonKey(name: 'total_count') required final int totalCount,
      @JsonKey(name: 'pageable_count') required final int pageableCount,
      @JsonKey(name: 'is_end') required final bool isEnd}) = _$PageMetaImpl;

  factory _PageMeta.fromJson(Map<String, dynamic> json) =
      _$PageMetaImpl.fromJson;

  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  @JsonKey(name: 'pageable_count')
  int get pageableCount;
  @override
  @JsonKey(name: 'is_end')
  bool get isEnd;
  @override
  @JsonKey(ignore: true)
  _$$PageMetaImplCopyWith<_$PageMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
