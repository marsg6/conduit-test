import 'package:assignment/core/network/dio_client.dart';
import 'package:assignment/feature/repository/image.dart';
import 'package:carbonic_logger/carbonic_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:assignment/feature/model/search_response.dart' as model;

part 'search_response.g.dart';

@riverpod
class SearchResponse extends _$SearchResponse {
  static const pageCountToQuery = 1;
  var _isFetchingMore = false;
  String? _currentQuery;
  int? _currentPageNumber;

  @override
  Future<model.SearchResponse?> build() async {
    return null;
  }

  Future<void> searchImages({
    required final String query,
  }) async {
    state = const AsyncValue.loading();
    try {
      final result = await ImageRepository(DioClient()).searchImages(
        query: query,
        page: pageCountToQuery,
      );
      _currentQuery = query;
      _currentPageNumber = pageCountToQuery;

      state = AsyncValue.data(result);
    } catch (e, s) {
      _currentQuery = null;
      _currentPageNumber = null;

      state = AsyncValue.error(e, s);
    }
  }

  void fetchMore() async {
    if (_isFetchingMore) {
      return;
    }

    final data = state.value;
    final query = _currentQuery;
    final pageNumber = _currentPageNumber;
    if (data == null ||
        query == null ||
        pageNumber == null ||
        data.pageMeta.isEnd) {
      return;
    }

    _isFetchingMore = true;

    try {
      final nextPageNumber = pageNumber + pageCountToQuery;
      final response = await ImageRepository(DioClient()).searchImages(
        query: query,
        page: nextPageNumber,
      );
      _currentPageNumber = nextPageNumber;

      state = AsyncValue.data(
        response.copyWith(
          images: [
            ...data.images,
            ...response.images,
          ],
        ),
      );
    } catch (e, s) {
      Logger.error(
        content: '이미지 검색 결과 추가 로드 실패',
        title: 'SearchResponse.fetchMore()',
        exception: e,
        stackTrace: s,
      );
    } finally {
      _isFetchingMore = false;
    }
  }
}
