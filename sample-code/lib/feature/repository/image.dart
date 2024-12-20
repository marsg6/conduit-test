import 'package:assignment/core/config.dart';
import 'package:assignment/feature/model/search_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'image.g.dart';

@RestApi()
abstract class ImageRepository {
  factory ImageRepository(final Dio dio) = _ImageRepository;

  @GET('/v2/search/image')
  @Headers({
    'Authorization': 'KakaoAK ${AppConfig.kakaoApiKey}',
  })
  Future<SearchResponse> searchImages({
    @Query('query') required final String query,
    @Query('page') required final int page,
    // @Query('size') final int? size,
  });
}
