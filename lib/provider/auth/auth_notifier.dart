import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_riverpod/provider/auth/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  login() {
    // 模拟登录
    Future.delayed(const Duration(seconds: 2), () {
      state = state.copyWith(isAuth: true);
    });
  }

  logout() {
    state = state.copyWith(isAuth: false);
  }
}
