import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'message_state.dart';

class MessageNotifier extends StateNotifier<MessageState> {
  MessageNotifier()
      : super(MessageState(isMessage: false, message: '', messageCount: 0));

  addMessage(String message) {
    state = state.copyWith(message: message);
  }

  getMessageCount() {
    Future.delayed(const Duration(seconds: 0), () {
      state =
          state.copyWith(isMessage: true, messageCount: state.messageCount + 1);
    });
  }
}
