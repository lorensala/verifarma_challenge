import 'package:authentication/authentication.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:omdb/omdb.dart';

class Injector {
  static void init() {
    GetIt.I
      ..registerLazySingleton<Dio>(
        () => Dio()..interceptors.addAll([LogInterceptor(), OmdbInterceptor()]),
      )
      ..registerLazySingleton<OmdbApi>(() => OmdbApi(dio: GetIt.I<Dio>()))
      ..registerLazySingleton<OmdbRepository>(
        () => OmdbRepository(api: GetIt.I<OmdbApi>()),
      )
      ..registerLazySingleton(AuthenticationRepository.new);
  }
}
