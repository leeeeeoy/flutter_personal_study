import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/riverpod/weather_app_v2/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    read: ref.read,
  );
});
