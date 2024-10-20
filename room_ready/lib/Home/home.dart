import 'package:flutter/material.dart';

import 'Widgets/ViewAllScreen.dart';

/*
  Serves currently as sample page
 */

class Home extends StatelessWidget {
  const Home({super.key});

  final String text = "Sample";

  @override

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destination Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViewAllScreen(),
    );
  }
}

