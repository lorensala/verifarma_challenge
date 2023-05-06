import 'package:dio/dio.dart';
import 'package:omdb/src/core/core.dart';

/// {@template omdb_interceptor}
/// Interceptor for the OMDb APi.
/// {@endtemplate}
class OmdbInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.queryParameters.addAll({
      'apikey': Strings.apiKey,
    });
    return super.onRequest(options, handler);
  }
}
