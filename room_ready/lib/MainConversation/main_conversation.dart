import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'conversation_helpers/message_input_field.dart';
import 'conversation_helpers/message_list.dart';
import 'conversation_helpers/conversations.dart'; // Assuming Conversations is defined in the same folder

class ChatScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: MessageListScreen()),
        ],
      ),
    );
  }
}
