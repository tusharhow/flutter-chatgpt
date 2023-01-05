enum MessageType { user, gpt }

class Message {
  Message({
    required this.message,
    required this.messageType,
  });

  final String message;
  final MessageType messageType;
}
