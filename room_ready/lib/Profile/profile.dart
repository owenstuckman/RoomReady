import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:room_ready/Profile/Profile-SubParts/liked.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Profile-SubParts/version.dart';

/*
  Serves currently as sample page
 */

class Profiles extends StatefulWidget {
  const Profiles({super.key});

  @override
  _ProfilesState createState() => _ProfilesState();

}

class _ProfilesState extends State<Profiles> {
  String _name = "";
  String _email = "";
  int _rewardPoints = 0;
  int _travelTrips = 0;
  int _bucketList = 0;

  @override
  void initState() {
    super.initState();
    _loadProfileData(); // Load profile data from local storage
  }

  // Load the profile data from shared preferences
  void _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? 'Ju Young Choi';
      _email = prefs.getString('email') ?? 'juyoung9@vt.edu';
      _rewardPoints = prefs.getInt('rewardPoints') ?? 5890;
      _travelTrips = prefs.getInt('travelTrips') ?? 41;
      _bucketList = prefs.getInt('bucketList') ?? 117;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              // Navigate to edit profile page or logic to edit profile
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Avatar and Info
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/profile_placeholder.png'), // Use a placeholder or a real profile image
                  ),
                  SizedBox(height: 10),
                  Text(
                    _name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(_email, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            // Points, Trips, Bucket List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _infoCard("Reward Points", _rewardPoints.toString()),
                  _infoCard("Travel Trips", _travelTrips.toString()),
                  _infoCard("Bucket List", _bucketList.toString()),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Settings Menu
            _settingsMenuItem(Icons.person, "Profile", () {
              // Navigate to Profile
              //cupertinopageroute
            }),
            _settingsMenuItem(Icons.favorite, "Liked", () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => Liked(),
                ),
              );
            }),
            _settingsMenuItem(Icons.history, "Previous Trips", () {
              // Navigate to Previous Trips
              //cupetrinopageroute
            }),
            _settingsMenuItem(Icons.settings, "Settings", () {
              // Navigate to App Settings
              //cupertinopageroute
            }),
            _settingsMenuItem(Icons.info, "Version", () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => Version(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  // Widget for Info Cards (Reward Points, Trips, Bucket List)
  Widget _infoCard(String title, String data) {
    return Column(
      children: [
        Text(data, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text(title, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  // Widget for Settings Menu Items
  Widget _settingsMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title),
      trailing: Icon(
          Icons.arrow_forward_ios, color: Colors.grey[700], size: 16),
      onTap: onTap,
    );
  }
}