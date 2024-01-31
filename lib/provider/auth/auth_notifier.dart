import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_riverpod/provider/auth/auth_state.dart';

import '../../core/provider/network_provider.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref ref;

  AuthNotifier(this.ref) : super(AuthState());

  login() async {
    final res = await ref.watch(networkProvider).post(
      '/api/authaccount/login',
      data: {
        "email": "test1994@gmail.com",
        "password": "123456",
      },
    );
    if (res.data['code'] == 0) {
      state = state.copyWith(isAuth: true);
    }
  }

  logout() {
    state = state.copyWith(isAuth: false);
  }
}
