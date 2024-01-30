import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_riverpod/provider/message/message_notifier.dart';
import 'package:hello_riverpod/provider/message/message_state.dart';

final messageProvider = StateNotifierProvider<MessageNotifier, MessageState>(
    (ref) => MessageNotifier());
