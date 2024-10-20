import 'package:flutter/material.dart';
import 'package:room_ready/Startup/Sign_in.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Signin()),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF4E6), // Updated to use Colors.orange[50]
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center align the image
            children: [
              Image.asset(
                'assets/images/homeImage.png', // Replace the text with your image
                width: 300, // You can adjust the width as needed
              ),
            ],
          ),
        ),
      ),
    );
  }
}
