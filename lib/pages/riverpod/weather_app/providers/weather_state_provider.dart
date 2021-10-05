import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/riverpod/weather_app/models/weather.dart';
import 'package:flutter_study/pages/riverpod/weather_app/providers/provider.dart';

class WeatherState {
  final bool? loading;
  final Weather? weather;
  final String? error;

  WeatherState({
    this.loading,
    this.weather,
    this.error,
  });

  WeatherState copyWith({
    bool? loading,
    Weather? weather,
    String? error,
  }) {
    return WeatherState(
      loading: loading ?? this.loading,
      weather: weather ?? this.weather,
      error: error ?? this.error,
    );
  }
}

final currentWeatherProvider =
    StateNotifierProvider<CurrentWeather, WeatherState>((ref) {
  print('>>> CurrentWeatherProvider <<<');

  return CurrentWeather(read: ref.read);
});

class CurrentWeather extends StateNotifier<WeatherState> {
  final Reader read;
  static WeatherState initialWeatherState = WeatherState();

  CurrentWeather({
    required this.read,
  }) : super(initialWeatherState);

  Future<void> fetchWeather() async {
    state = state.copyWith(loading: true, error: '');
    final String city = read(cityProvider).state;

    try {
      final Weather weather =
          await read(weatherRepositoryProvider).getWeather();
      state = state.copyWith(
        loading: false,
        weather: weather,
        error: '',
      );
    } catch (e) {
      state = state.copyWith(
        loading: false,
        error: 'Can not fetch the weather of $city',
      );
    }
  }
}

final weatherStateProvider = Provider<WeatherState>((ref) {
  print('>>> WeatherStateProvider <<<');
  final WeatherState weather = ref.watch(currentWeatherProvider);

  return weather;
});
