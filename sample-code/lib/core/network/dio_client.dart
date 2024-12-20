import 'package:assignment/core/config.dart';
import 'package:assignment/core/network/interceptor/log.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_animate/flutter_animate.dart';

enum HeaderTemplate {
  json,
  ;

  Map<String, String?> get headers {
    switch (this) {
      case json:
        return {
          'Content-Type': 'application/json;charset=UTF-8',
        };
    }
  }
}

class DioClient with DioMixin implements Dio {
  DioClient({
    final String? baseUrl,
    final HeaderTemplate? headerTemplate,
    final Map<String, String?>? headers,
  }) : assert(
          !(headers != null && headerTemplate != null),
          'baseUrl과 headerTemplate은 동시에 사용할 수 없습니다.',
        ) {
    options = BaseOptions(
      baseUrl: baseUrl ?? AppConfig.kakaoBaseUrl,
      headers: headerTemplate?.headers ?? headers,
      sendTimeout: 5000.ms,
      receiveTimeout: 5000.ms,
      connectTimeout: 5000.ms,
    );

    httpClientAdapter = IOHttpClientAdapter();

    interceptors.addAll(
      [
        CustomLogInterceptor(
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          error: true,
        ),
      ],
    );
  }
}
