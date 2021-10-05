import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:last_fm/src/constants.dart';
import 'package:last_fm/src/core/data/datasources/lastfm_api.dart';
import 'package:last_fm/src/core/data/repositories/core_repository_impl.dart';
import 'package:last_fm/src/core/domain/repositories/core_repository.dart';
import 'package:last_fm/src/core/domain/usecases/track/get_track_info.dart';
import 'package:last_fm/src/core/domain/usecases/track/search_tracks.dart';

import 'core/utils/app_logger.dart';
import 'core/utils/logger_interceptor.dart';

final sl = GetIt.instance;

Future initInjections() async {
  initRootLogger();

  // dio instance
  sl.registerSingletonAsync<Dio>(() async {
    final dio = Dio(BaseOptions(
        baseUrl: AppConstants.baseUrl,
        validateStatus: (s) {
          return s! < 300;
        },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "charset": "utf-8",
          "Accept-Charset": "utf-8",
          "Accept-Language": "en"
        },
        responseType: ResponseType.json));

    dio.interceptors.add(LoggerInterceptor(
      logger,
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: true,
    ));
    return dio;
  });
  await sl.isReady<Dio>();

  // lastfmApi , repositories
  sl.registerLazySingleton<LastfmApi>(() => LastfmApi(sl()));
  sl.registerLazySingleton<CoreRepository>(() => CoreRepositoryImpl(sl()));

  // usecases
  sl.registerFactory<GetTrackInfo>(() => GetTrackInfo(sl()));
  sl.registerFactory<SearchTracks>(() => SearchTracks(sl()));
}
