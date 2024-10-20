
import 'package:shared_preferences/shared_preferences.dart';

class local_Data{

  void _saveProfileData(String name, String email,String password, int rewardPoints, int travelTrips, int bucketList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setString('email', email);
    prefs.setString('password', password);
    prefs.setInt('rewardPoints', rewardPoints);
    prefs.setInt('travelTrips', travelTrips);
    prefs.setInt('bucketList', bucketList);
  }

}
