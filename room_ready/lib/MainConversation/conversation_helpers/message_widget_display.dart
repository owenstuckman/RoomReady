import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Message.dart';

class MessageWidget extends StatelessWidget {
  final Message message;

  const MessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.sender == 'me' ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        color: message.sender == 'me' ? Colors.blue[100] : Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.sender,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(message.content),
              SizedBox(height: 5),
              Text(
                message.timestamp.toString(),
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

