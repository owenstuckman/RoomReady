import 'package:flutter/material.dart';
import 'package:room_ready/Startup/Sign_up.dart'; 
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
        backgroundColor: const Color(0xFFFFF4E6), 
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(
                'BON',
                style: TextStyle(
                  fontSize: 48, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 48, 
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: 'V'),
                    TextSpan(text: 'O', style: TextStyle(color: Colors.orange)), 
                    TextSpan(text: 'YAGE'),
                  ],
                ),
              ),
              Text(
                'by Marriott',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600, 
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
