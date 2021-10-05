import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/riverpod/weather_app_v2/models/app_config.dart';

final appConfigProvider = StateProvider<AppConfig>((ref) {
  const String kPort = '8080';
  final String baseUrl =
      Platform.isAndroid ? 'http://10.0.2.2:$kPort' : 'http://localhost:$kPort';

  return AppConfig(
    baseUrl: baseUrl,
    buildFlavor: 'dev',
  );
});
