import 'package:bloc/bloc.dart';
import 'package:flutter_day3_iti/bloc/weather_event.dart';
import 'package:flutter_day3_iti/bloc/weather_state.dart';
import 'package:flutter_day3_iti/datasource/remote/api/ApiService.dart';
import 'package:flutter_day3_iti/model/WeatherResponse.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(LoadingState()) {
    on<FetchWeatherByCityName>((event, emit) => _fetchWeather(event));
  }

  _fetchWeather(FetchWeatherByCityName event) async {
    WeatherResponse response = await ApiService.api.fetchWeatherByCity(event.city);
    try {
      if (response != null) {
        emit(SuccessState(response));
      }
    } catch (e) {
      emit(ErrorState());
    }
  }
}
