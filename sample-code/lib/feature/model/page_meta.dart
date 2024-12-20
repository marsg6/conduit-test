import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_meta.freezed.dart';
part 'page_meta.g.dart';

@freezed
class PageMeta with _$PageMeta {
  factory PageMeta({
    @JsonKey(name: 'total_count') required final int totalCount,
    @JsonKey(name: 'pageable_count') required final int pageableCount,
    @JsonKey(name: 'is_end') required final bool isEnd,
  }) = _PageMeta;

  factory PageMeta.fromJson(Map<String, dynamic> json) =>
      _$PageMetaFromJson(json);
}
