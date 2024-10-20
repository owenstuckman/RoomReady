import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_ready/MainConversation/conversation_helpers/conversations.dart';

class MessageInputField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                // Send the entered text instead of "sample"
                Conversations().sendMessages(1, 2, _controller.text, 1);
                _controller.clear();  // Clear the input after sending the message
              }
            },
          ),
        ],
      ),
    );
  }
}
