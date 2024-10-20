import 'package:shared_preferences/shared_preferences.dart';

class local_Data {
  // Method to save profile data
  void saveProfileData(String name, String email, String password, int rewardPoints, int travelTrips, int bucketList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setString('email', email);
    prefs.setString('password', password);
    prefs.setInt('rewardPoints', rewardPoints);
    prefs.setInt('travelTrips', travelTrips);
    prefs.setInt('bucketList', bucketList);
  }

  Future<void> saveYearMonth(String month, int year) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedMonth', month);
    prefs.setInt('selectedYear', year);
  }

  Future<Map<String, dynamic>> getYearMonth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? month = prefs.getString('selectedMonth');
    int? year = prefs.getInt('selectedYear');
    return {'month': month, 'year': year};
  }

   void saveMinMaxBudget(double minBudget, double maxBudget) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('minBudget', minBudget);
    prefs.setDouble('maxBudget', maxBudget);
  }

   Future<void> saveLocation(String location) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('location', location);
  }

  Future<bool> dataLogin(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');
    
    if (storedEmail == email && storedPassword == password) {
      return true; // Match
    } else {
      return false; // No match
    }
  }

    Future<void> saveInterests(List<String> selectedInterests) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('selectedInterests', selectedInterests);
  }

  Future<List<String>?> getInterests() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('selectedInterests');
  }

  Future<void> saveLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedLanguage', language);
  }

    Future<void> saveStartEndDate(DateTime startDate, DateTime endDate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('startDate', startDate.toString());
    prefs.setString('endDate', endDate.toString());
  }


Future<String?> getLocation() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('location');
}

Future<int?> getMinBudget() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('minBudget');
}

Future<int?> getMaxBudget() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('maxBudget');
}

Future<DateTime?> getStartDate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? startDateString = prefs.getString('startDate');
  return startDateString != null ? DateTime.parse(startDateString) : null;
}

Future<DateTime?> getEndDate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? endDateString = prefs.getString('endDate');
  return endDateString != null ? DateTime.parse(endDateString) : null;
}



}