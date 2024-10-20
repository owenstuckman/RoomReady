import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_ready/MainConversation/conversation_helpers/conversations.dart';
import 'message_widget_display.dart';
import 'message_input_field.dart';

class MessageListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<Conversations>(
              builder: (context, messageProvider, child) {
                if (messageProvider.messages.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: messageProvider.messages.length,
                    itemBuilder: (context, index) {
                      final message = messageProvider.messages[index];
                      return MessageWidget(message: message);
                    },
                  );
                }
              },
            ),
          ),
          // Add the input field at the bottom
          MessageInputField(),
        ],
      ),
    );
  }
}
