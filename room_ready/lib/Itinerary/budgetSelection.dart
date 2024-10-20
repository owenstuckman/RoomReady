import 'package:flutter/material.dart';
import 'package:room_ready/Home/home.dart';
import 'package:room_ready/Itinerary/Itinerary.dart';
import 'package:room_ready/Itinerary/yearPicker.dart';
import 'package:room_ready/home_page.dart';

class budgetSelection extends StatelessWidget {
  const budgetSelection({super.key});

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
                'What is your budget?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),

              // Row for Min and Max Budget TextFields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                children: [
                  // Min Budget Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // Align text and field to the center
                    children: [
                      Text(
                        'Min Budget',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8), 
                      
                      SizedBox(
                        width: 150, 
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'ex. \$2000',
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Max Budget Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // Align text and field to the center
                    children: [
                      Text(
                        'Max Budget',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8), 



                      SizedBox(
                        width: 150,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'ex. \$5000',
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20), // Add some space before the buttons




              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                children: [
                  // Back Button
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
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



                  // Next Button
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => yearPicker()),
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



            ],
          ),
        ),
      ),
    );
  }
}
