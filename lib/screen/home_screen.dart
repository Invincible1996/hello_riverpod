import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_riverpod/screen/login_screen.dart';

import '../provider/auth/auth_provider.dart';
import '../provider/auth/auth_state.dart';
import '../provider/message/message_provider.dart';
import 'profile_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final messageState = ref.watch(messageProvider);
    ref.listen<AuthState>(
      authProvider,
      (value, next) {
        // if login success fetch user data from api
        if (value!.isAuth) {
          // fetch user data from api
          ref.read(messageProvider.notifier).getMessageCount();
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Home'),
        actions: [
          // show message unread count if user is authenticated ,unread count is in message provider
          if (authState.isAuth)
            Text('Unread Count: ${messageState.messageCount}')
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // show login status
            Text(
              'isAuth: ${authState.isAuth}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (authState.isAuth) {
                  // Navigator.pushNamed(context, '/profile');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }
              },
              child: const Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
