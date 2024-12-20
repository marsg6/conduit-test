import 'package:assignment/core/ui/cached_network_image.dart';
import 'package:assignment/core/utility/call_wrapper.dart';
import 'package:assignment/feature/provider/bookmarked_images.dart';
import 'package:assignment/feature/provider/bookmarked_images_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class BookmarkedListPage extends ConsumerWidget {
  const BookmarkedListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(bookmarkedImagesProvider);
    return SafeArea(
      child: images.isEmpty
          ? const Center(
              child: Text(
                '즐겨찾기한 이미지가 없습니다',
              ),
            )
          : ListView.separated(
              itemCount: images.length,
              separatorBuilder: (context, index) => const Gap(20),
              itemBuilder: (context, index) {
                final image = images[index];
                return Card(
                  margin: EdgeInsets.fromLTRB(
                    20,
                    index == 0 ? 20 : 0,
                    20,
                    index == images.length - 1 ? 20 : 0,
                  ),
                  elevation: 10,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 100,
                        ),
                        child: CustomCachedNetworkImage(
                          image.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0.3),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Consumer(
                          builder: (context, ref, child) {
                            final bookmarked = ref.watch(
                              bookmarkedImagesSetProvider.select(
                                (images) => images.contains(image),
                              ),
                            );
                            return IconButton(
                              iconSize: 36,
                              onPressed: () => Throttler.processAsync(
                                hashCode,
                                () async {
                                  final provider = ref
                                      .read(bookmarkedImagesProvider.notifier);
                                  if (bookmarked) {
                                    await provider.unbookmark(image);
                                  } else {
                                    await provider.bookmark(image);
                                  }
                                },
                              ),
                              icon: Icon(
                                bookmarked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
