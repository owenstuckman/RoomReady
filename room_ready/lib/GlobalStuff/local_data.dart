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

  // Method to check if the given email and password match with stored data
  Future<bool> dataLogin(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // Retrieve stored email and password from SharedPreferences
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');
    
    // Compare the given email and password with stored values
    if (storedEmail == email && storedPassword == password) {
      return true; // Match
    } else {
      return false; // No match
    }
  }
}
