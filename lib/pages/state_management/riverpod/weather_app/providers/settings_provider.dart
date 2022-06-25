import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TemperatureUnit {
  celcius,
  fahrenheit,
}

final settingsProvider = StateProvider<TemperatureUnit>((ref) {
  log('>>> SettingsProvider <<<');
  return TemperatureUnit.celcius;
});
