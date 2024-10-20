import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:room_ready/Itinerary/Calender.dart';
import 'package:room_ready/Itinerary/budgetSelection.dart';

class yearPicker extends StatefulWidget {
  const yearPicker({super.key});

  @override
  _yearPickerState createState() => _yearPickerState();
}

class _yearPickerState extends State<yearPicker> {
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  final List<int> years = List.generate(10, (index) => 2020 + index);

  int selectedMonthIndex = 9;  // Default to October
  int selectedYearIndex = 4;   // Default to 2024

  // Function to save the selected month and year to SharedPreferences
  void _saveYearMonth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedMonth', months[selectedMonthIndex]);
    prefs.setInt('selectedYear', years[selectedYearIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'When are you traveling?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),

            // Month and Year Pickers
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Month Picker
                SizedBox(
                  height: 150,  
                  width: 250,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    diameterRatio: 1.5,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedMonthIndex = index;
                      });
                    },
                    physics: FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            months[index],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: selectedMonthIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        );
                      },
                      childCount: months.length,
                    ),
                  ),
                ),

                // Year Picker
                SizedBox(
                  height: 150, 
                  width: 250,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    diameterRatio: 1.5,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedYearIndex = index;
                      });
                    },
                    physics: FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            years[index].toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: selectedYearIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        );
                      },
                      childCount: years.length,
                    ),
                  ),
                ),
              ],
            ),

            // Row for Back and Next buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align buttons
              children: [
                // Back Button
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => budgetSelection()),
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
                    _saveYearMonth(); // Save selected month and year
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarPage()),
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
    );
  }
}
