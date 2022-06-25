import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app_v2/repositories/weather_api_client.dart';
import 'package:http/http.dart' as http;

final weatherApiClientProvider = Provider<WeatherApiClient>((ref) {
  log('>>> WeatherApiClientProvider <<<');
  return WeatherApiClient(httpClient: http.Client());
});
