import 'package:dio/dio.dart';

import '../storage.dart';

class DioClient {
  static Dio create() {
    final dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await SecureStorage.readToken();
        if (token != null ) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (e, handler) => handler.next(e),
    ));

    return dio;
  }
}