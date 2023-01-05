import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../models/chat_model.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget(
      {super.key, required this.message, required this.messageType});

  final String message;
  final MessageType messageType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: messageType == MessageType.gpt
          ? const EdgeInsets.only(left: 16.0, right: 10.0)
          : const EdgeInsets.only(right: 16.0, left: 10.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color:
              messageType == MessageType.gpt ? Colors.deepPurple : Colors.grey,
          borderRadius: messageType == MessageType.gpt
              ? const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            messageType == MessageType.gpt
                ? Container(
                    margin: const EdgeInsets.only(right: kDefaultPadding),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.network(
                        'https://cdn.iconscout.com/icon/free/png-256/flutter-2038877-1720090.png',
                        height: 25,
                      ),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(right: kDefaultPadding),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                      ),
                    ),
                  ),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: kDefaultPadding,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
