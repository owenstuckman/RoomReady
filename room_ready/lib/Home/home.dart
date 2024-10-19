import 'package:flutter/material.dart';

/*
  Serves currently as sample page
 */

class Home extends StatelessWidget {
  const Home({super.key});

  final String text = "Sample";

  @override

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
