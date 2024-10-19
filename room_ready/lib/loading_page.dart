import 'package:flutter/material.dart';
import 'package:room_ready/Home/home.dart';



class Loading extends StatelessWidget{
    const Loading({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
        ],
        ),
      )
  );
}

}

