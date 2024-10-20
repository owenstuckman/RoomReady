import 'package:flutter/material.dart';
import 'package:room_ready/Itinerary/Calender.dart';
import 'package:room_ready/Itinerary/toBring.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:room_ready/GlobalStuff/local_data.dart';

class ItineraryPage extends StatelessWidget {
  const ItineraryPage({super.key});

  Future<void> fetchItinerary(String location, String maxBudget, String minBudget, String startDate, String endDate) async {
    final url = Uri.parse('http://18.221.165.54:3000/generate-itinerary');

        List<String>? selectedInterests = await local_Data().getInterests();
          if (selectedInterests == null) {
      selectedInterests = ["Nature"]; // You can set a default value
    }


    // Use http.post instead of manually creating http.Request
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'location': location, 'minBudget': minBudget, 'maxBudget': maxBudget, 'selectedInterests': selectedInterests, '_selectedStartDay': startDate, '_selectedEndDay': endDate}),
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
  @override
  Widget build(BuildContext context) {
    // Hardcoded itinerary data for now (this will be fetched via JSON later)
    final List<Map<String, dynamic>> itinerary = [
      {
        'date': 'October 22 2024, Tuesday',
        'events': [
          {'time': '9:00AM', 'description': 'Breakfast at La Grande Boucherie'},
          {'time': '10:00AM', 'description': 'Walk at Central Park'},
          {'time': '12:00PM', 'description': 'Lunch at The Modern'},
          {'time': '1:00PM', 'description': 'Go to MoMa'},
          {'time': '5:30PM', 'description': 'Go to Manhattan Art & Antiques Center'},
          {'time': '7:00PM', 'description': 'Dinner at Ellen’s Stardust Diner'},
        ]
      },
      {
        'date': 'October 23 2024, Wednesday',
        'events': [
          {'time': '9:00AM', 'description': 'Breakfast at Levain Bakery'},
          {'time': '10:00AM', 'description': 'Go to The Metropolitan Museum of Art'},
          {'time': '12:00PM', 'description': 'Lunch at The MET Dining Room'},
          {'time': '3:00PM', 'description': 'Visit Michael Werner Gallery'},
          {'time': '6:00PM', 'description': 'Walk at 5th Avenue'},
          {'time': '7:00PM', 'description': 'Dinner at The Penrose Bar'},
        ]
      },
      {

          'date': 'October 23 2024, Wednesday',
        'events': [
          {'time': '9:00AM', 'description': 'Breakfast at Levain Bakery'},
          {'time': '10:00AM', 'description': 'Go to The Metropolitan Museum of Art'},
          {'time': '12:00PM', 'description': 'Lunch at The MET Dining Room'},
          {'time': '3:00PM', 'description': 'Visit Michael Werner Gallery'},
          {'time': '6:00PM', 'description': 'Walk at 5th Avenue'},
          {'time': '7:00PM', 'description': 'Dinner at The Penrose Bar'},
        ]
        

      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Itinerary'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  const Text(
                    'Itinerary',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  for (Map<String, dynamic> day in itinerary) // Explicit type added
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          day['date'] as String, // Cast to String explicitly
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 10),
                        for (Map<String, dynamic> event in day['events'] as List<Map<String, dynamic>>) // Explicit type added
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    event['time'] as String, // Cast to String explicitly
                                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    event['description'] as String, // Cast to String explicitly
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),

          // Row for Back and Next buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Back Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => CalendarPage()),
                      );                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 20), // Space between buttons
                // Next Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => toBring()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}