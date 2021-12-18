import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TemperatureUnit {
  celcius,
  fahrenheit,
}

final settingsProvider = StateProvider<TemperatureUnit>((ref) {
  print('>>> SettingsProvider <<<');
  return TemperatureUnit.celcius;
});
