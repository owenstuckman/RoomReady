import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:room_ready/Itinerary/yearPicker.dart';

class calendarPage extends StatefulWidget {
  const calendarPage({super.key});

  @override
  _calendarPageState createState() => _calendarPageState();
}

class _calendarPageState extends State<calendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedStartDay;
  DateTime? _selectedEndDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Calendar - Date Range'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                // Highlight the selected start and end days
                return isSameDay(_selectedStartDay, day) || isSameDay(_selectedEndDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  if (_selectedStartDay == null || (_selectedStartDay != null && _selectedEndDay != null)) {
                    // Start a new range
                    _selectedStartDay = selectedDay;
                    _selectedEndDay = null;
                  } else if (_selectedStartDay != null && _selectedEndDay == null && selectedDay.isAfter(_selectedStartDay!)) {
                    // Set the end day
                    _selectedEndDay = selectedDay;
                  }
                  _focusedDay = focusedDay; // Update the focused day
                });
              },
              calendarFormat: CalendarFormat.month, // Change this to week/month/2 weeks
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false, // Hide the days outside current month
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false, // Hide format toggle button
                titleCentered: true,
                titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // Custom dayBuilder to highlight days between selected start and end dates
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  if (_selectedStartDay != null &&
                      _selectedEndDay != null &&
                      day.isAfter(_selectedStartDay!) &&
                      day.isBefore(_selectedEndDay!)) {
                    // Highlight the days between the start and end dates
                    return Container(
                      margin: const EdgeInsets.all(6.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.5), // Highlight color for in-between dates
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${day.day}',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return null; // Return null to let TableCalendar handle it
                },
                todayBuilder: (context, day, focusedDay) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.orange, // Highlight today's date
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${day.day}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
                selectedBuilder: (context, day, focusedDay) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue, // Highlight selected start/end dates
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${day.day}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            // Display the selected range
            if (_selectedStartDay != null)
              Text(
                'Start: ${_selectedStartDay?.toLocal().toString().split(' ')[0]}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            if (_selectedEndDay != null)
              Text(
                'End: ${_selectedEndDay?.toLocal().toString().split(' ')[0]}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

               TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => yearPicker()),
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
          ],



        ),
      ),
    );
  }
}
