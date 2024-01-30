class AuthState {
  final bool isAuth;
  AuthState({this.isAuth = false});

  AuthState copyWith({bool? isAuth}) {
    return AuthState(isAuth: isAuth ?? this.isAuth);
  }
}
