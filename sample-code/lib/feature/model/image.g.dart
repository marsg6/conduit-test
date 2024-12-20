// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageModelImpl _$$ImageModelImplFromJson(Map<String, dynamic> json) =>
    _$ImageModelImpl(
      thumbnailUrl: json['thumbnail_url'] as String,
      imageUrl: json['image_url'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      siteName: json['display_sitename'] as String,
    );

Map<String, dynamic> _$$ImageModelImplToJson(_$ImageModelImpl instance) =>
    <String, dynamic>{
      'thumbnail_url': instance.thumbnailUrl,
      'image_url': instance.imageUrl,
      'width': instance.width,
      'height': instance.height,
      'display_sitename': instance.siteName,
    };
