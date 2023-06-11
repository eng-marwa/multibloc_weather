abstract class CityEvent{
}
class CitySelected extends CityEvent{
  String city;
  CitySelected(this.city);
}