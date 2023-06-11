import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_day3_iti/bloc/CityBloc.dart';
import 'package:flutter_day3_iti/bloc/city_event.dart';
import 'package:flutter_day3_iti/bloc/weather_bloc.dart';
import 'package:flutter_day3_iti/bloc/weather_event.dart';
import 'package:flutter_day3_iti/bloc/weather_state.dart';
import 'package:flutter_day3_iti/datasource/local/cities.dart';
import 'package:flutter_day3_iti/datasource/remote/api/constants.dart';
import 'package:flutter_day3_iti/model/WeatherResponse.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context,listen: false);
    weatherBloc.add(FetchWeatherByCityName(cities[0]));
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  'Select City Name',
                  style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                BlocBuilder<CityBloc, String>(
                  builder: (context, state) {
                    return DropdownButton<String>(
                      items: cities
                          .map((e) =>
                          DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                          .toList(),
                      onChanged: (value) {
                        CityBloc cityBloc = BlocProvider.of<CityBloc>(context,listen: false);
                        cityBloc.add(CitySelected(value!));
                        weatherBloc.add(FetchWeatherByCityName(value!));

                      },
                      value: state,
                    );
                  },
                ),
                SizedBox(
                  height: 80,
                ),
                BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) {
                      if (state is SuccessState) {
                        WeatherResponse weatherResponse = state.weatherResponse;
                        return Column(children: [
                          Image.network('$IMG_URL${weatherResponse.weather![0]
                              .icon}.png'),
                          Text('${weatherResponse.main!.temp}'),
                          Text('${weatherResponse.weather![0].description}')
                        ],);
                      } else if (state is ErrorState) {
                        return Text(state.toString(),
                          style: const TextStyle(color: Colors.red),);
                      } else {
                        return const CircularProgressIndicator();
                      }
                    })
              ],
            ),
          )),
    );
  }
}
