import 'package:dio/dio.dart';

class DioConfig {
  DioConfig._();
  static Dio getDio() {
    BaseOptions baseOptions =
        BaseOptions(baseUrl: "https://api.openweathermap.org/data/2.5/");
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(LogInterceptor(
        error: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true));
    return dio;
  }
}
