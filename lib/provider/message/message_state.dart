class MessageState {
  final String message;
  final bool isMessage;
  final int messageCount;

  MessageState({
    required this.message,
    required this.isMessage,
    required this.messageCount,
  });

  MessageState copyWith({String? message, bool? isMessage, int? messageCount}) {
    return MessageState(
      message: message ?? this.message,
      isMessage: isMessage ?? this.isMessage,
      messageCount: messageCount ?? this.messageCount,
    );
  }
}
