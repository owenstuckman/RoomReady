import 'package:flutter/material.dart';

class GlobalVariables {

  static List<String> getSeason() {
    switch (DateTime.now().month) {
      case 11:
      case 0:
      case 1:
        return ['winter'];
      case 2:
        return ['spring', 'winter'];
      case 3:
        return ['spring'];
      case 4:
        return ['spring', 'summer'];
      case 5:
      case 6:
      case 7:
        return ['summer'];
      case 8:
        return ['summer', 'fall'];
      case 9:
        return ['fall'];
      case 10:
        return ['fall', 'winter'];
    }
    return ['all'];
  }

  static Map priceConvert = {
    'free': 0,
    'Free': 0,
    r'$': 1,
    r'$$': 2,
    r'$$$': 3,
    r'$$$$': 4,
    r'$$$$$': 5
  };
  static Map priceText = {
    '' : '',
    'free' : 'Free',
    'Free' : 'Free',
    r'$' : 'Cheap',
    r'$$' : 'Affordable',
    r'$$$' : 'Pricey',
    r'$$$$' : 'Expensive',
    r'$$$$$' : 'Very Expensive'
  };
  static Map mapPrice = {
    1 : r'$',
    2 : r'$$',
    3 : r'$$$',
    4 : r'$$$$',
  };

  static List<double> timeConvert(String timeText) {
    var timeString = timeText.split('-');
    var time = [0.0, 0.0];
    var timeUnit = [1.0, 1.0, 0.0]; //#3 for null safety
    for (int i = timeString.length - 1; i > -1; i--) {
      if (timeString[i].toLowerCase().contains('hr')) {
        timeUnit[i] = 60;
      }
      if ((!timeString[i].toLowerCase().contains('hr')) &&
          (!timeString[i].toLowerCase().contains('min'))) {
        timeUnit[i] = timeUnit[i + 1];
      }
      time[i] = timeUnit[i] *
          (double.tryParse(timeString[i]
              .toLowerCase()
              .replaceAll('hr', '')
              .replaceAll('min', '')
              .replaceAll('s', '')
              .replaceAll('_', '')
          .replaceAll(' ', '')
              .replaceAll('+', '')) ?? 1);
    }
    if(timeText.contains('+')){
      time[1] = 10800;
    }
    return time.where((element) => element != 0).toList();
  }

  static Color accountColor(String? color) {
    switch (color) {
      case "red":
        return Colors.redAccent;
      case "orange":
        return Colors.orangeAccent;
      case "yellow":
        return Colors.amberAccent;
      case "lime":
        return Colors.lightGreenAccent;
      case "green":
        return Colors.lightGreen;
      case "cyan":
        return Colors.cyanAccent;
      case "blue":
        return Colors.blue;
      case "purple":
        return Colors.purple;
      case "violet":
        return Colors.purpleAccent;
      case "pink":
        return Colors.pinkAccent;
      case "grey":
        return Colors.grey;
      case "brown":
        return Colors.brown;
      case "gold":
        return Colors.amber;
      case "burnt sienna":
        return Color(0xff7c431c);
    }
    return Colors.white;
  }

  static List<String> colorOptions = [
    'white',
    'red',
    'orange',
    'yellow',
    'lime',
    'green',
    'cyan',
    'blue',
    'purple',
    'violet',
    'pink',
    'grey',
    'brown'
  ];

  static List<String?> locationOptions = [
    null,
    "AK",
    "AL",
    "AR",
    "AZ",
    "CA",
    "CO",
    "CT",
    "DE",
    "FL",
    "GA",
    "HI",
    "IA",
    "ID",
    "IL",
    "IN",
    "KS",
    "KY",
    "LA",
    "MA",
    "MD",
    "ME",
    "MI",
    "MN",
    "MO",
    "MS",
    "MT",
    "NC",
    "ND",
    "NE",
    "NH",
    "NJ",
    "NM",
    "NV",
    "NY",
    "OH",
    "OK",
    "OR",
    "PA",
    "RI",
    "SC",
    "SD",
    "TN",
    "TX",
    "UT",
    "VA",
    "VT",
    "WA",
    "WI",
    "WV",
    "WY"
  ];
  static List<String?> genderOptions = [
    null,
    'Male',
    'Female',
    'Prefer not to say'
  ];

  static int getMonthLength(int month, int year) {
    switch (month) {
      case 2:
        if (year % 4 == 0) {
          return 29;
        }
        return 28;
      case 4:
      case 6:
      case 9:
      case 11:
        return 30;
    }
    return 31;
  }

  static Map monthText = {
    1: "January",
    2: "February",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: "August",
    9: "September",
    10: "October",
    11: "November",
    12: "December",
  };

  static List<int?> generateRange(int min, int max, {bool reverse = false}) {
    List<int> response = [];
    for (int i = min; i < max + 1; i++) {
      response.add(i);
    }
    if (reverse) {
      return response.reversed.toList();
    }
    return response;
  }
}
