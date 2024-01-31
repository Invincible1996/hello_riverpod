import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_riverpod/provider/auth/auth_notifier.dart';
import 'package:hello_riverpod/provider/auth/auth_state.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier(ref));
