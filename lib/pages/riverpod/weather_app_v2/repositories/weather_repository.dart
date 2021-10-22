import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/riverpod/weather_app_v2/models/weather.dart';
import 'package:flutter_study/pages/riverpod/weather_app_v2/providers/provider.dart';

class WeatherRepository {
  final Reader read;

  WeatherRepository({
    required this.read,
  });

  Future<Weather> getWeather() async {
    final String city = read(cityProvider).state;

    try {
      final int locationId =
          await read(weatherApiClientProvider).getLocationId(city);

      return await read(weatherApiClientProvider).fetchWeather(locationId);
    } catch (e) {
      throw e.toString();
    }
  }
}