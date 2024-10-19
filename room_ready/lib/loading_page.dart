import 'package:flutter/material.dart';
import 'package:room_ready/Home/home.dart';


class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E6), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Text(
              'Bon',
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


            // Positioned(
            //   bottom: 8,
            //   right: 20,
            //   child: Container(
            //     width: 30,
            //     height: 10,
            //     color: Colors.orange
            //   )
            //   ),
          
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
    );
  }
}

