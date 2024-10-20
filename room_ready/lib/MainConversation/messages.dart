import 'package:flutter/material.dart';
import 'package:room_ready/MainConversation/messageCard.dart';
import 'package:room_ready/MainConversation/message_data.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  String _searchQuery = '';  

  List<Message> _filterMessages(String query) {
    if (query.isEmpty) {
      return messages;
    }
    return messages.where((message) {
      return message.name.toLowerCase().contains(query.toLowerCase()) ||
          message.lastMessage.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // Get the filtered messages
    List<Message> filteredMessages = _filterMessages(_searchQuery);

    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search TextField
            TextField(
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;  // Update search query on every keystroke
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                hintText: 'Search for chats & messages',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),

            // List of Messages
            Expanded(
              child: filteredMessages.isEmpty
                  ? Center(
                      child: Text(
                        'No messages found',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredMessages.length,
                      itemBuilder: (context, index) {
                        final message = filteredMessages[index];
                        return ChatMessageCard(
                          name: message.name,
                          avatar: message.icon,
                          lastMessage: message.lastMessage,
                          lastMessageDate: message.date, 
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
