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
        backgroundColor: const Color.fromRGBO(247, 237, 219, 1), 
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Image.asset(
                'assets/images/homeImage.png', 
                width: 300, 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
