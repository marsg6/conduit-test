import 'package:assignment/feature/model/image.dart';
import 'package:assignment/feature/model/page_meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response.freezed.dart';
part 'search_response.g.dart';

@freezed
class SearchResponse with _$SearchResponse {
  factory SearchResponse({
    @JsonKey(name: 'meta') required final PageMeta pageMeta,
    @JsonKey(name: 'documents') required final List<ImageModel> images,
  }) = _SearchResponse;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}
