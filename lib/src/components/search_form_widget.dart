import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/src/constants/color.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../models/chat_model.dart';

class SearchFormWidget extends StatelessWidget {
  const SearchFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<ChatController>(
          init: ChatController(),
          builder: (controller) {
            return controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: TextFormField(
                      controller: controller.messageController,
                      style: const TextStyle(color: Colors.white54),
                      decoration: InputDecoration(
                        hintText: 'Type your query',
                        hintStyle: const TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: bgColor2,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.messages.add(
                              Message(
                                  message: controller.messageController.text,
                                  messageType: MessageType.user),
                            );
                            controller.isLoading(true);
                            controller.update();
                            var query = controller.messageController.text;
                            controller.messageController.clear();
                            Future.delayed(const Duration(milliseconds: 55))
                                .then((_) => controller.scrollToBottom());

                            controller.sendMessage(query).then((value) {
                              controller.isLoading(false);
                              controller.update();
                              controller.messages.add(
                                Message(
                                  message: value,
                                  messageType: MessageType.gpt,
                                ),
                              );
                              controller.update();
                            });
                            controller.messageController.clear();
                            Future.delayed(const Duration(milliseconds: 55))
                                .then((_) => controller.scrollToBottom());
                          },
                          icon: const Icon(Icons.send, color: Colors.white54),
                        ),
                      ),
                    ),
                  );
          }),
    );
  }
}
