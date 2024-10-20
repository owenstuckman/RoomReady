
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Liked extends StatefulWidget {
  const Liked({super.key});

  _LikedState createState() => _LikedState();
}

class _LikedState extends State<Liked> {

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home: Scaffold(
     appBar: AppBar(
      title: Text('Paris'),
     ),
     body: Center(
      child: MyCard(),
     ),
    ),
   );
  }
}

  class MyCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Inner padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Eiffel Tower',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Space between title and content
            Text(
              'All Glittery and shit',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
