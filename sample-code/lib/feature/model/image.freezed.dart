// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) {
  return _ImageModel.fromJson(json);
}

/// @nodoc
mixin _$ImageModel {
  @JsonKey(name: 'thumbnail_url')
  String get thumbnailUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'width')
  int get width => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_sitename')
  String get siteName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageModelCopyWith<ImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageModelCopyWith<$Res> {
  factory $ImageModelCopyWith(
          ImageModel value, $Res Function(ImageModel) then) =
      _$ImageModelCopyWithImpl<$Res, ImageModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'thumbnail_url') String thumbnailUrl,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'width') int width,
      @JsonKey(name: 'height') int height,
      @JsonKey(name: 'display_sitename') String siteName});
}

/// @nodoc
class _$ImageModelCopyWithImpl<$Res, $Val extends ImageModel>
    implements $ImageModelCopyWith<$Res> {
  _$ImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnailUrl = null,
    Object? imageUrl = null,
    Object? width = null,
    Object? height = null,
    Object? siteName = null,
  }) {
    return _then(_value.copyWith(
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      siteName: null == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageModelImplCopyWith<$Res>
    implements $ImageModelCopyWith<$Res> {
  factory _$$ImageModelImplCopyWith(
          _$ImageModelImpl value, $Res Function(_$ImageModelImpl) then) =
      __$$ImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'thumbnail_url') String thumbnailUrl,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'width') int width,
      @JsonKey(name: 'height') int height,
      @JsonKey(name: 'display_sitename') String siteName});
}

/// @nodoc
class __$$ImageModelImplCopyWithImpl<$Res>
    extends _$ImageModelCopyWithImpl<$Res, _$ImageModelImpl>
    implements _$$ImageModelImplCopyWith<$Res> {
  __$$ImageModelImplCopyWithImpl(
      _$ImageModelImpl _value, $Res Function(_$ImageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnailUrl = null,
    Object? imageUrl = null,
    Object? width = null,
    Object? height = null,
    Object? siteName = null,
  }) {
    return _then(_$ImageModelImpl(
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      siteName: null == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageModelImpl implements _ImageModel {
  _$ImageModelImpl(
      {@JsonKey(name: 'thumbnail_url') required this.thumbnailUrl,
      @JsonKey(name: 'image_url') required this.imageUrl,
      @JsonKey(name: 'width') required this.width,
      @JsonKey(name: 'height') required this.height,
      @JsonKey(name: 'display_sitename') required this.siteName});

  factory _$ImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageModelImplFromJson(json);

  @override
  @JsonKey(name: 'thumbnail_url')
  final String thumbnailUrl;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  @JsonKey(name: 'width')
  final int width;
  @override
  @JsonKey(name: 'height')
  final int height;
  @override
  @JsonKey(name: 'display_sitename')
  final String siteName;

  @override
  String toString() {
    return 'ImageModel(thumbnailUrl: $thumbnailUrl, imageUrl: $imageUrl, width: $width, height: $height, siteName: $siteName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageModelImpl &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.siteName, siteName) ||
                other.siteName == siteName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, thumbnailUrl, imageUrl, width, height, siteName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageModelImplCopyWith<_$ImageModelImpl> get copyWith =>
      __$$ImageModelImplCopyWithImpl<_$ImageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageModelImplToJson(
      this,
    );
  }
}

abstract class _ImageModel implements ImageModel {
  factory _ImageModel(
          {@JsonKey(name: 'thumbnail_url') required final String thumbnailUrl,
          @JsonKey(name: 'image_url') required final String imageUrl,
          @JsonKey(name: 'width') required final int width,
          @JsonKey(name: 'height') required final int height,
          @JsonKey(name: 'display_sitename') required final String siteName}) =
      _$ImageModelImpl;

  factory _ImageModel.fromJson(Map<String, dynamic> json) =
      _$ImageModelImpl.fromJson;

  @override
  @JsonKey(name: 'thumbnail_url')
  String get thumbnailUrl;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(name: 'width')
  int get width;
  @override
  @JsonKey(name: 'height')
  int get height;
  @override
  @JsonKey(name: 'display_sitename')
  String get siteName;
  @override
  @JsonKey(ignore: true)
  _$$ImageModelImplCopyWith<_$ImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
