import 'package:flutter/material.dart';
import 'package:room_ready/Itinerary/budgetSelection.dart';

class Itinerary extends StatelessWidget {
  const Itinerary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Where are you traveling?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30), 

              TextField(
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

              SizedBox(height:20),


              TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => budgetSelection()),
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

            ],
          ),
        ),
      ),
    );
  }
}