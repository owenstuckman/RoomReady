import 'package:flutter/material.dart';
import 'package:room_ready/Itinerary/budgetSelection.dart';
import 'package:room_ready/GlobalStuff/local_data.dart'; // Import local_Data class

class Itinerary extends StatelessWidget {
  Itinerary({super.key});

  final TextEditingController locationController = TextEditingController(); // Controller for location input
  final local_Data localData = local_Data(); // Instance of your local data class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Center content vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title Text
              Text(
                'Where are you traveling?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),

              // TextField for Location Input
              TextField(
                controller: locationController, // Attach the controller here
                decoration: InputDecoration(
                  hintText: 'ex. New York',
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 40), // Spacer below the TextField

              // "Next" Button
              TextButton(
                onPressed: () async {
                  String location = locationController.text;

                  local_Data().saveLocation(location);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => budgetSelection(), 
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20), // Add some space at the bottom if needed
            ],
          ),
        ),
      ),
    );
  }
}
