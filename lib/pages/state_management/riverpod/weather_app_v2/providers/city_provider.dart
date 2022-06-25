import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityProvider = StateProvider<String>((ref) {
  log('>>> CityProvider <<<');
  return '';
});
