import 'package:flutter/material.dart';
import 'package:room_ready/Startup/Sign_in.dart'; 
import 'package:room_ready/GlobalStuff/local_data.dart'; 

class Interests extends StatefulWidget {
  const Interests({super.key});

  @override
  _InterestsState createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  List<Map<String, dynamic>> interests = [
    {'name': 'Nightlife', 'isChecked': false},
    {'name': 'Sports', 'isChecked': false},
    {'name': 'Arts', 'isChecked': false},
    {'name': 'Luxury', 'isChecked': false},
    {'name': 'Nature', 'isChecked': false},
    {'name': 'Leisure', 'isChecked': false},
    {'name': 'Adventure', 'isChecked': false},
    {'name': 'Beach', 'isChecked': false},
    {'name': 'Mountains', 'isChecked': false},
    {'name': 'Shopping', 'isChecked': false},
    {'name': 'Foodie', 'isChecked': false},
    {'name': 'Activities', 'isChecked': false},
    {'name': 'Architecture', 'isChecked': false},
    {'name': 'Music', 'isChecked': false},
    {'name': 'History', 'isChecked': false},
  ];

  void _toggleCheck(int index) {
    setState(() {
      interests[index]['isChecked'] = !interests[index]['isChecked'];
    });
  }

  void _saveSelectedInterests() {
    List<String> selectedInterests = interests
        .where((interest) => interest['isChecked'] == true)
        .map((interest) => interest['name'] as String)
        .toList();

    local_Data().saveInterests(selectedInterests);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Interests'),
        backgroundColor: Colors.orange[100], 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: interests.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(interests[index]['name']),
                    trailing: IconButton(
                      icon: Icon(
                        interests[index]['isChecked']
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: interests[index]['isChecked'] ? Colors.blue : Colors.grey,
                      ),
                      onPressed: () => _toggleCheck(index),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  _saveSelectedInterests(); 
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Signin()), 
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
