import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';
part 'image.g.dart';

@Freezed(toJson: true)
class ImageModel with _$ImageModel {
  factory ImageModel({
    @JsonKey(name: 'thumbnail_url') required final String thumbnailUrl,
    @JsonKey(name: 'image_url') required final String imageUrl,
    @JsonKey(name: 'width') required final int width,
    @JsonKey(name: 'height') required final int height,
    @JsonKey(name: 'display_sitename') required final String siteName,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}
