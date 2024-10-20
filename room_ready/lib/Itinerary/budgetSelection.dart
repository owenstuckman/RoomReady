import 'package:flutter/material.dart';
import 'package:room_ready/Itinerary/yearPicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:room_ready/GlobalStuff/local_data.dart';
import 'package:room_ready/home_page.dart';

class budgetSelection extends StatelessWidget {
  budgetSelection({super.key});

  final TextEditingController minBudgetController = TextEditingController();
  final TextEditingController maxBudgetController = TextEditingController();

  final local_Data localData = local_Data(); // Instance of your local data class

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
                          controller: minBudgetController, // Controller for min budget
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
                          keyboardType: TextInputType.number,
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
                          controller: maxBudgetController, // Controller for max budget
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
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20), // Add some space before the buttons

              // Row for Back and Next Buttons
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
                    onPressed: () async {
                      double minBudget = double.tryParse(minBudgetController.text) ?? 0.0;
                      double maxBudget = double.tryParse(maxBudgetController.text) ?? 0.0;

                      // Save min and max budget to SharedPreferences
                      localData.saveMinMaxBudget(minBudget, maxBudget);

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
