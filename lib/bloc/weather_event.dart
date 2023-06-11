abstract class WeatherEvent{}
class FetchWeatherByCityName extends WeatherEvent{
  String city;
  FetchWeatherByCityName(this.city);
}