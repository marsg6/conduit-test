import 'dart:convert';

import 'package:carbonic_logger/carbonic_logger.dart';
import 'package:get_storage/get_storage.dart';

enum LocalStorageCategory {
  bookmarkedImages,
  ;

  GetStorage get storage => GetStorage(storageKey);

  /// ex) bookmarkedImages -> bookmarked_images
  String get storageKey => name.replaceAllMapped(
        RegExp('[A-Z]'),
        (match) => '_${match.group(0)!.toLowerCase()}',
      );
}

class LocalStorageManager {
  const LocalStorageManager._();

  static Future<void> initialize() async {
    await Future.wait([
      for (final category in LocalStorageCategory.values)
        GetStorage.init(category.storageKey),
    ]);
  }

  static Object? getData({
    required final LocalStorageCategory category,
    final int? userId,
    final String? extraIdentifier,
  }) {
    try {
      final encodedData = category.storage.read(
        _makeKey(
          category: category,
          userId: userId,
          extraIdentifier: extraIdentifier,
        ),
      );
      if (encodedData == null) {
        return null;
      }
      return jsonDecode(encodedData);
    } catch (e) {
      return null;
    }
  }

  static Future<void> setData({
    required final LocalStorageCategory category,
    final int? userId,
    final String? extraIdentifier,
    required final Object data,
  }) async {
    try {
      final encodedData = jsonEncode(data);
      await category.storage.write(
        _makeKey(
          category: category,
          userId: userId,
          extraIdentifier: extraIdentifier,
        ),
        encodedData,
      );
    } catch (e, s) {
      Logger.error(
        content:
            '로컬 저장소 데이터 저장 실패\ncategory: ${category.name} userId: $userId, '
            'extraIdentifier: $extraIdentifier,\ndata: ${_jsonToString(data)}',
        title: 'LocalStorageManager.setData()',
        exception: e,
        stackTrace: s,
      );
    }
  }

  static String _makeKey({
    required final LocalStorageCategory category,
    final int? userId,
    final String? extraIdentifier,
  }) =>
      _concat([
        category.name,
        userId?.toString(),
        extraIdentifier,
      ]);

  static String _concat(final List<String?> elements) =>
      elements.where((element) => element != null).join('_');

  static String _jsonToString(final Object message) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(message);
  }
}
