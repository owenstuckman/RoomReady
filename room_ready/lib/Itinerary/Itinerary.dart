import 'package:flutter/material.dart';
import 'package:room_ready/Itinerary/Calender.dart';
import 'package:room_ready/Itinerary/toBring.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:room_ready/GlobalStuff/local_data.dart';

class ItineraryPage extends StatefulWidget {
  const ItineraryPage({super.key});

  @override
  _ItineraryPageState createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  List<Map<String, dynamic>> itinerary = [];

  @override
  void initState() {
    super.initState();
    // Call the API and update the itinerary
    _loadItinerary();
  }

  Future<void> _loadItinerary() async {
  try {
    // Use await to get asynchronous data
    final location = await local_Data().getLocation();
    final minBudget = await local_Data().getMinBudget();
    final maxBudget = await local_Data().getMaxBudget();
    final startDate = await local_Data().getStartDate();
    final endDate = await local_Data().getEndDate();
    
    // Fetch itinerary using the retrieved values
    List<Map<String, dynamic>> fetchedItinerary = await fetchItinerary(
      location ?? "Unknown location",    
      minBudget?.toString() ?? "0",      
      maxBudget?.toString() ?? "0",     
      startDate?.toIso8601String() ?? "2024-01-01",  
      endDate?.toIso8601String() ?? "2024-12-31",   
    );

    // Update the state with the fetched itinerary
    setState(() {
      itinerary = fetchedItinerary;
    });
  } catch (e) {
    print('Error fetching itinerary: $e');
  }
}

  Future<List<Map<String, dynamic>>> fetchItinerary(String location, String maxBudget, String minBudget, String startDate, String endDate) async {
    final url = Uri.parse('http://18.221.165.54:3000/generate-itinerary');

    List<String>? selectedInterests = await local_Data().getInterests();
    selectedInterests ??= ["Nature"]; // Set a default value if null

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'location': location,
        'minBudget': minBudget,
        'maxBudget': maxBudget,
        'selectedInterests': selectedInterests,
        '_selectedStartDay': startDate,
        '_selectedEndDay': endDate
      }),
    );

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      print(responseBody['result']);
      if (responseBody['result'] != null && responseBody['result']['itinerary'] != null) {
        // Parse the itinerary correctly from the response
        List<dynamic> itineraryList = responseBody['result']['itinerary'];
        
        // Updated conversion logic
        return itineraryList.map((item) {
          return Map<String, dynamic>.from(item);
        }).toList();
      } else {
        throw Exception('Failed to parse itinerary');
      }
    } else {
      throw Exception('Failed to load itinerary data');
    }
  }

  @override
  Widget build(BuildContext context) {
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
              child: itinerary.isEmpty
                  ? const Center(child: CircularProgressIndicator()) // Show a loader while fetching data
                  : ListView(
                      children: [
                        const Text(
                          'Itinerary',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        for (Map<String, dynamic> day in itinerary)
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
                              for (Map<String, dynamic> event in (day['events'] as List<dynamic>).map((e) => Map<String, dynamic>.from(e)))
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
                                          event['time'] as String,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          event['description'] as String,
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
