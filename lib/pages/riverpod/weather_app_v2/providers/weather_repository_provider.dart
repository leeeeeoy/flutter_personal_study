import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/riverpod/weather_app_v2/repositories/weather_repository.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  print('>>> WeatherRepositoryProvider <<<');

  return WeatherRepository(read: ref.read);
});
