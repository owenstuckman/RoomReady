import 'package:flutter/material.dart';

import 'main_conversation.dart';

// Assuming ChatScreen is already defined in another file

class ChatMessageCard extends StatelessWidget {
  final String name;
  final Icon avatar;
  final String lastMessage;
  final String lastMessageDate;

  const ChatMessageCard({
    Key? key,
    required this.name,
    required this.avatar,
    required this.lastMessage,
    required this.lastMessageDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()), // Route to ChatScreen
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 24,
              child: avatar,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        lastMessageDate,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    lastMessage,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
