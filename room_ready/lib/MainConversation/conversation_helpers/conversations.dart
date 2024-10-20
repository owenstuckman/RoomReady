

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Conversations extends ChangeNotifier {
  List<dynamic> _messages = [];

  List<dynamic> get messages => _messages;


  Future<void> fetchConversations(String userId) async {
    final url = Uri.parse('http://18.221.165.54:3000/get_conversations');

    // Use http.post instead of manually creating http.Request
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userid': userId}),
    );

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      // Assuming responseBody is a list and you're interested in the second message
      print(responseBody[1]);
      print("Work please");
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
    }
  }

  // Add a message to the list
  void addMessage(String sender, String messageContent) {
    _messages.add({
      'sender': sender,
      'content': messageContent,
    });
    notifyListeners(); // Notify UI to rebuild
  }
}

/*

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Conversations extends ChangeNotifier {
  List<dynamic> _messages = [];

  List<dynamic> get messages => _messages;


  Future<void> fetchConversations(String userId) async {
    final url = Uri.parse('http://18.221.165.54:3000/get_conversations');
    try {
      var response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        _messages = responseBody;
        notifyListeners();  // Notifies listeners to rebuild widgets
        print(_messages[1]);
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }


  // Add a message to the list
  void addMessage(String sender, String messageContent) {
    _messages.add({
      'sender': sender,
      'content': messageContent,
    });
    notifyListeners(); // Notify UI to rebuild
  }
}


 */