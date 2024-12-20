import 'package:assignment/core/utility/local_storage/manager.dart';
import 'package:assignment/feature/model/image.dart';
import 'package:carbonic_utility/carbonic_utility.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmarked_images.g.dart';

@Riverpod(keepAlive: true)
class BookmarkedImages extends _$BookmarkedImages {
  @override
  List<ImageModel> build() {
    return cast<List>(
          LocalStorageManager.getData(
            category: LocalStorageCategory.bookmarkedImages,
          ),
        )?.map((e) => ImageModel.fromJson(e)).toList() ??
        [];
  }

  Future<void> bookmark(final ImageModel image) async {
    state = [
      image,
      ...state,
    ];

    await LocalStorageManager.setData(
      category: LocalStorageCategory.bookmarkedImages,
      data: state,
    );
  }

  Future<void> unbookmark(final ImageModel image) async {
    state = [
      ...state.where((element) => element != image),
    ];

    await LocalStorageManager.setData(
      category: LocalStorageCategory.bookmarkedImages,
      data: state,
    );
  }
}
