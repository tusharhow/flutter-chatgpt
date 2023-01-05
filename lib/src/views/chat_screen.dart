import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/src/constants/color.dart';
import 'package:flutter_chatgpt/src/controllers/chat_controller.dart';
import 'package:get/get.dart';
import '../components/message_widget.dart';
import '../components/search_form_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat GPT',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: bgColor,
      ),
      body: GetBuilder<ChatController>(
          init: ChatController(),
          builder: (controller) {
            return Column(
              children: const [
                MessageWidget(),
                Spacer(),
                SearchFormWidget(),
              ],
            );
          }),
    );
  }
}
