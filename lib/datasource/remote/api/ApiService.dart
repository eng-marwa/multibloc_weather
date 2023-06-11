import 'package:dio/dio.dart';
import 'package:flutter_day3_iti/datasource/remote/api/DioConfig.dart';
import 'package:flutter_day3_iti/datasource/remote/api/constants.dart';
import 'package:flutter_day3_iti/model/WeatherResponse.dart';

class ApiService {
  //1- Single instance
  ApiService._(); //private named constructor
  static final ApiService api = ApiService._();

  //2-fetch weather by city
  Future<WeatherResponse> fetchWeatherByCity(String city) async {
    String url = "weather";
    Map<String, dynamic> parameters = {"q": city, "appid": API_KEY};
    Dio dio = DioConfig.getDio();
    Response response = await dio.get(url, queryParameters: parameters);
    if (response.statusCode == 200) {
      return WeatherResponse.fromJson(response.data);
    } else {
      throw Exception('Unable to fetch endpoint');
    }
  }
}
