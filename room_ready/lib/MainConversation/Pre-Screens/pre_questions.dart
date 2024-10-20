import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pre_questions extends StatefulWidget {
  @override
  _pre_questionsState createState() => _pre_questionsState();
}

class _pre_questionsState extends State<pre_questions> {
  String _selectedOption = "";
  TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Are you a Local or a Tourist?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please select if you are a local or a tourist:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedOption = 'Local';
                    });
                  },
                  child: Text('Local'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedOption == 'Local'
                        ? Colors.blue
                        : Colors.grey, // Change color when selected
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedOption = 'Tourist';
                    });
                  },
                  child: Text('Tourist'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedOption == 'Tourist'
                        ? Colors.blue
                        : Colors.grey, // Change color when selected
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Enter your location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_selectedOption.isEmpty ||
                    _locationController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select an option and enter a location.'),
                    ),
                  );
                } else {
                  // You can handle what to do with the user's choice and location here.
                  print('User is a $_selectedOption and their location is ${_locationController.text}');
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }
}