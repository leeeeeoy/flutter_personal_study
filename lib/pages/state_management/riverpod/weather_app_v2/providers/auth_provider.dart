import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/pages/state_management/riverpod/weather_app_v2/providers/auth_repository_provider.dart';

class AuthState {
  final bool loggingIn;
  final bool authenticated;
  final bool tryingAutoLogin;
  final String error;

  AuthState({
    this.loggingIn = false,
    this.authenticated = false,
    this.tryingAutoLogin = false,
    this.error = '',
  });

  AuthState copyWith({
    bool? loggingIn,
    bool? authenticated,
    bool? tryingAutoLogin,
    String? error,
  }) {
    return AuthState(
      loggingIn: loggingIn ?? this.loggingIn,
      authenticated: authenticated ?? this.authenticated,
      tryingAutoLogin: tryingAutoLogin ?? this.tryingAutoLogin,
      error: error ?? this.error,
    );
  }
}

final authProvider = StateNotifierProvider<Auth, AuthState>((ref) {
  return Auth(
    read: ref.read,
  );
});

class Auth extends StateNotifier<AuthState> {
  final Reader read;

  static AuthState initialAuthState = AuthState();
  Auth({
    required this.read,
  }) : super(initialAuthState);

  Future<void> login(String email, String password) async {
    state = state.copyWith(
      loggingIn: true,
      error: '',
    );

    try {
      await read(authRepositoryProvider).login(email, password);
      state = state.copyWith(
        loggingIn: false,
        authenticated: true,
      );
    } catch (e) {
      log('$e');
      state = state.copyWith(
        loggingIn: false,
        error: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    await read(authRepositoryProvider).logout();
    state = state.copyWith(
      loggingIn: false,
      authenticated: false,
      error: '',
    );
  }

  Future<void> tryAutoLogin() async {
    state = state.copyWith(
      tryingAutoLogin: true,
    );
    final bool authenticated = await read(authRepositoryProvider).tryAutoLogin();
    state = state.copyWith(
      tryingAutoLogin: false,
      authenticated: authenticated,
    );
  }
}

final authStateProvider = Provider<AuthState>((ref) {
  final AuthState auth = ref.watch(authProvider);
  return auth;
});
