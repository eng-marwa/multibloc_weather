import 'package:flutter_day3_iti/model/WeatherResponse.dart';

abstract class WeatherState{}
class SuccessState extends WeatherState{
  WeatherResponse weatherResponse;
  SuccessState(this.weatherResponse);
}
class ErrorState extends WeatherState{

}
class LoadingState extends WeatherState{}