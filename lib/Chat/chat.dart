import 'package:flutter/material.dart';

import 'chats/message.dart';
import 'chats/new_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Welcome to chat group! "),
          backgroundColor: Color.fromARGB(255, 156, 182, 255)),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/message.jpg"),
        )),
        child: Column(
          children: [
            Expanded(child: Message()),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
