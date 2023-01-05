import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/src/constants/api_constants.dart';
import 'package:flutter_chatgpt/src/services/network_service.dart';
import 'package:get/get.dart';
import '../models/chat_model.dart';

class ChatController extends GetxController {
  final NetworkService _networkService = NetworkService();

  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final List<Message> messages = [];
  var isLoading = false.obs;

  Future<String> sendMessage(String message) async {
    final Map<String, dynamic> data = {
      "model": "text-davinci-003",
      "prompt": message,
      'temperature': 0,
      'max_tokens': 2000,
      'top_p': 1,
      'frequency_penalty': 0.0,
      'presence_penalty': 0.0,
    };
    final Map<String, dynamic> headers = {
      "content-type": "application/json",
      "Authorization": "Bearer $API_KEY",
    };
    try {
      final response = await _networkService.post('$BASE_URL$END_POINT',
          data: data, headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.data);
        return data['choices'][0]['text'];
      } else {
        throw Exception('Failed to send request to server');
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
