import 'package:flutter/material.dart';

class Message {
  final String name;
  final String lastMessage;
  final String date;
  final Icon icon;

  Message({
    required this.name,
    required this.lastMessage,
    required this.date,
    required this.icon,
  });
}

List<Message> messages = [
  Message(
    name: 'Nathan Walker',
    lastMessage: 'You: Are there any local restaurants?',
    date: '09:41',
    icon: Icon(Icons.person),
  ),
  Message(
    name: 'Amanda Holly',
    lastMessage: 'Typing...',
    date: '08:42',
    icon: Icon(Icons.person),
  ),
  Message(
    name: 'Alex Caler',
    lastMessage: 'Alex: Safe Travels!',
    date: 'Yesterday',
    icon: Icon(Icons.person),
  ),
];
