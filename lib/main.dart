import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/src/constants/color.dart';
import 'src/views/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat GPT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        canvasColor: bgColor,
        primarySwatch: Colors.deepPurple,
      ),
      home: const ChatScreen(),
    );
  }
}
