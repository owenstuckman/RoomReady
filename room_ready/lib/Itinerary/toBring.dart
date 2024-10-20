import 'package:flutter/material.dart';
import 'package:room_ready/Itinerary/Calender.dart';

class Item {
  String name;
  bool isChecked;

  Item({required this.name, this.isChecked = false});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      isChecked: json['isChecked'] ?? false, // Default is unchecked
    );
  }
}

class toBring extends StatefulWidget {
  const toBring({super.key});

  @override
  _toBringState createState() => _toBringState();
}

class _toBringState extends State<toBring> {
  // You can replace this with data fetched from a JSON file
  List<Item> items = [
    Item(name: "Toothbrush"),
    Item(name: "Socks"),
    Item(name: "Passport"),
  ];

  // Function to toggle check status
  void _toggleCheck(int index) {
    setState(() {
      items[index].isChecked = !items[index].isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items to Bring'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index].name),
                  trailing: IconButton(
                    icon: Icon(
                      items[index].isChecked
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: items[index].isChecked ? Colors.green : Colors.grey,
                    ),
                    onPressed: () => _toggleCheck(index),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20), // Add space between list and button
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CalendarPage()), // You can replace this with your desired page
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            child: Text(
              'Back',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
