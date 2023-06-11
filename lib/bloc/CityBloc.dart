import 'package:bloc/bloc.dart';
import 'package:flutter_day3_iti/datasource/local/cities.dart';

import 'city_event.dart';

class CityBloc extends Bloc<CityEvent,String>{
  CityBloc():super(cities[0]){
    on<CitySelected>((event, emit) => emit(event.city));
  }
}