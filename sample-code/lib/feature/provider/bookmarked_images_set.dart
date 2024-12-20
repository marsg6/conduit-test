import 'package:assignment/feature/model/image.dart';
import 'package:assignment/feature/provider/bookmarked_images.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmarked_images_set.g.dart';

/// 각 타일에서 빠른 contains 검사를 위해 bookmarkedImagesProvider 상태에 종속적인 BookmarkedImagesSet 정의
@riverpod
class BookmarkedImagesSet extends _$BookmarkedImagesSet {
  @override
  Set<ImageModel> build() {
    return ref.watch(bookmarkedImagesProvider).toSet();
  }
}
