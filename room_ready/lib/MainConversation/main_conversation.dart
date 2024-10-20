import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'conversation_helpers/message_input_field.dart';
import 'conversation_helpers/message_list.dart';

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