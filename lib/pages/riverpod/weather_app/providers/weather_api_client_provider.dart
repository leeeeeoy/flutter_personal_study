import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/riverpod/weather_app/repositories/weather_api_client.dart';
import 'package:http/http.dart' as http;

final weatherApiClientProvider = Provider<WeatherApiClient>((ref) {
  print('>>> WeatherApiClientProvider <<<');
  return WeatherApiClient(httpClient: http.Client());
});
