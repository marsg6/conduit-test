// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) {
  return _SearchResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchResponse {
  @JsonKey(name: 'meta')
  PageMeta get pageMeta => throw _privateConstructorUsedError;
  @JsonKey(name: 'documents')
  List<ImageModel> get images => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchResponseCopyWith<SearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResponseCopyWith<$Res> {
  factory $SearchResponseCopyWith(
          SearchResponse value, $Res Function(SearchResponse) then) =
      _$SearchResponseCopyWithImpl<$Res, SearchResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'meta') PageMeta pageMeta,
      @JsonKey(name: 'documents') List<ImageModel> images});

  $PageMetaCopyWith<$Res> get pageMeta;
}

/// @nodoc
class _$SearchResponseCopyWithImpl<$Res, $Val extends SearchResponse>
    implements $SearchResponseCopyWith<$Res> {
  _$SearchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageMeta = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      pageMeta: null == pageMeta
          ? _value.pageMeta
          : pageMeta // ignore: cast_nullable_to_non_nullable
              as PageMeta,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PageMetaCopyWith<$Res> get pageMeta {
    return $PageMetaCopyWith<$Res>(_value.pageMeta, (value) {
      return _then(_value.copyWith(pageMeta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchResponseImplCopyWith<$Res>
    implements $SearchResponseCopyWith<$Res> {
  factory _$$SearchResponseImplCopyWith(_$SearchResponseImpl value,
          $Res Function(_$SearchResponseImpl) then) =
      __$$SearchResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'meta') PageMeta pageMeta,
      @JsonKey(name: 'documents') List<ImageModel> images});

  @override
  $PageMetaCopyWith<$Res> get pageMeta;
}

/// @nodoc
class __$$SearchResponseImplCopyWithImpl<$Res>
    extends _$SearchResponseCopyWithImpl<$Res, _$SearchResponseImpl>
    implements _$$SearchResponseImplCopyWith<$Res> {
  __$$SearchResponseImplCopyWithImpl(
      _$SearchResponseImpl _value, $Res Function(_$SearchResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageMeta = null,
    Object? images = null,
  }) {
    return _then(_$SearchResponseImpl(
      pageMeta: null == pageMeta
          ? _value.pageMeta
          : pageMeta // ignore: cast_nullable_to_non_nullable
              as PageMeta,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$SearchResponseImpl implements _SearchResponse {
  _$SearchResponseImpl(
      {@JsonKey(name: 'meta') required this.pageMeta,
      @JsonKey(name: 'documents') required final List<ImageModel> images})
      : _images = images;

  factory _$SearchResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchResponseImplFromJson(json);

  @override
  @JsonKey(name: 'meta')
  final PageMeta pageMeta;
  final List<ImageModel> _images;
  @override
  @JsonKey(name: 'documents')
  List<ImageModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'SearchResponse(pageMeta: $pageMeta, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResponseImpl &&
            (identical(other.pageMeta, pageMeta) ||
                other.pageMeta == pageMeta) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pageMeta, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResponseImplCopyWith<_$SearchResponseImpl> get copyWith =>
      __$$SearchResponseImplCopyWithImpl<_$SearchResponseImpl>(
          this, _$identity);
}

abstract class _SearchResponse implements SearchResponse {
  factory _SearchResponse(
          {@JsonKey(name: 'meta') required final PageMeta pageMeta,
          @JsonKey(name: 'documents') required final List<ImageModel> images}) =
      _$SearchResponseImpl;

  factory _SearchResponse.fromJson(Map<String, dynamic> json) =
      _$SearchResponseImpl.fromJson;

  @override
  @JsonKey(name: 'meta')
  PageMeta get pageMeta;
  @override
  @JsonKey(name: 'documents')
  List<ImageModel> get images;
  @override
  @JsonKey(ignore: true)
  _$$SearchResponseImplCopyWith<_$SearchResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
