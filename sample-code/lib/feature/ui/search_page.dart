import 'package:assignment/core/route/route.dart';
import 'package:assignment/core/ui/cached_network_image.dart';
import 'package:assignment/core/utility/call_wrapper.dart';
import 'package:assignment/feature/provider/bookmarked_images.dart';
import 'package:assignment/feature/provider/bookmarked_images_set.dart';
import 'package:assignment/feature/ui/detail_page.dart';
import 'package:assignment/feature/provider/search_response.dart';
import 'package:carbonic_ui_kit/carbonic_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late final TextEditingController _searchTextEditingController;

  @override
  void initState() {
    super.initState();
    _searchTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SearchBar(
              hintText: '검색어를 입력하세요',
              controller: _searchTextEditingController,
              trailing: [
                IconButton(
                  onPressed: () => Throttler.processAsync(
                    hashCode,
                    _trySearch,
                  ),
                  icon: const Icon(Icons.search),
                ),
              ],
              onSubmitted: (value) => Throttler.processAsync(
                hashCode,
                _trySearch,
              ),
            ),
          ),
          const Expanded(
            child: KeyboardDismissOnTap(
              dismissOnCapturedTaps: true,
              child: _SearchedImageList(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _trySearch() async {
    await ref.read(searchResponseProvider.notifier).searchImages(
          query: _searchTextEditingController.text,
        );
  }
}

class _SearchedImageList extends ConsumerStatefulWidget {
  const _SearchedImageList({super.key});

  @override
  ConsumerState<_SearchedImageList> createState() => __SearchedImageListState();
}

class __SearchedImageListState extends ConsumerState<_SearchedImageList> {
  late final ScrollController _controller;
  int? _totalCount;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_tryFetchMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_tryFetchMore);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(searchResponseProvider);
    return data.when(
      data: (data) {
        if (data == null) {
          return const SizedBox.shrink();
        }

        final images = data.images;
        if (images.isEmpty) {
          return const Center(
            child: Text(
              '검색 결과가 없습니다',
            ),
          );
        }

        _totalCount = images.length;
        final totalCount = _totalCount!;
        return ListView.separated(
          controller: _controller,
          scrollDirection: Axis.vertical,
          itemCount: totalCount,
          separatorBuilder: (context, index) => const Gap(10),
          itemBuilder: (context, index) {
            final image = images[index];
            return Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                0,
                20,
                index == totalCount - 1 ? 20 : 0,
              ),
              child: ElevatedButton(
                onPressed: () => Throttler.processSync(
                  hashCode,
                  () => CustomRoute.detail.go(
                    context,
                    DetailPageRoutingInfo(
                      imageUrl: image.imageUrl,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SpacedRow(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCachedNetworkImage(
                          image.thumbnailUrl,
                          width: 64,
                          height: 64,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            image.siteName.isNotEmpty
                                ? image.siteName
                                : '사이트 불명',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final bookmarked = ref.watch(
                          bookmarkedImagesSetProvider.select(
                            (images) => images.contains(image),
                          ),
                        );
                        return IconButton(
                          onPressed: () => Throttler.processAsync(
                            hashCode,
                            () async {
                              final provider =
                                  ref.read(bookmarkedImagesProvider.notifier);
                              if (bookmarked) {
                                await provider.unbookmark(image);
                              } else {
                                await provider.bookmark(image);
                              }
                            },
                          ),
                          icon: Icon(
                            bookmarked ? Icons.favorite : Icons.favorite_border,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      error: (error, stackTrace) => const Center(
        child: Text(
          '검색에 실패했습니다',
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }

  void _tryFetchMore() {
    final count = _totalCount;
    if (count == null || count == 0) {
      return;
    }

    if (_controller.positions.length != 1) {
      return;
    }

    // 현재 스크롤 위치가 20개 정도의 타일이 남았을 때 추가로 데이터 로딩을 시도한다.
    final ratio = ((count - 20) / count).clamp(0, 1);
    if (_controller.position.maxScrollExtent * ratio <= _controller.offset) {
      ref.read(searchResponseProvider.notifier).fetchMore();
    }
  }
}
