import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:room_ready/Itinerary/yearPicker.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
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
                return isSameDay(_selectedStartDay, day) || isSameDay(_selectedEndDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  if (_selectedStartDay == null || (_selectedStartDay != null && _selectedEndDay != null)) {
                    _selectedStartDay = selectedDay;
                    _selectedEndDay = null;
                  } else if (_selectedStartDay != null && _selectedEndDay == null && selectedDay.isAfter(_selectedStartDay!)) {
                    _selectedEndDay = selectedDay;
                  }
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: CalendarFormat.month,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  if (_selectedStartDay != null &&
                      _selectedEndDay != null &&
                      day.isAfter(_selectedStartDay!) &&
                      day.isBefore(_selectedEndDay!)) {
                    return Container(
                      margin: const EdgeInsets.all(6.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${day.day}',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return null;
                },
                todayBuilder: (context, day, focusedDay) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.orange,
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
                      color: Colors.blue,
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
