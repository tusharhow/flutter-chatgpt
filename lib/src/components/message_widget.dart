import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import 'chat_message_widget.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GetBuilder<ChatController>(
            init: ChatController(),
            builder: (controller) {
              return ListView.builder(
                shrinkWrap: true,
                controller: controller.scrollController,
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  var message = controller.messages[index];
                  return ChatMessageWidget(
                    message: message.message,
                    messageType: message.messageType,
                  );
                },
              );
            }));
  }
}
