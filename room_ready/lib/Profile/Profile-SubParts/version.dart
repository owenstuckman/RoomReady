
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Version extends StatefulWidget {
  const Version({super.key});

  _VersionState createState() => _VersionState();
}

class _VersionState extends State<Version> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Version Info"),
      ),
      child: Center(
        child: Text(
          "App Version: 1.1.37", // Replace with your version info
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// cupertino page route
// material page route