import 'package:flutter/material.dart';
import 'package:room_ready/Itinerary/budgetSelection.dart';
import 'package:room_ready/Itinerary/Calender.dart';

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

  final List<int> years = List.generate(50, (index) => 2020 + index);

  int selectedMonthIndex = 9; 
  int selectedYearIndex = 4;  

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
                    'Back',
                    style: TextStyle(
                      color: Colors.black, 
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => calendarPage()),
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