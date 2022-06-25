import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app_v2/repositories/weather_repository.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  log('>>> WeatherRepositoryProvider <<<');

  return WeatherRepository(read: ref.read);
});
