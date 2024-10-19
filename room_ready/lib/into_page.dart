import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/*
  Serves currently as sample page
 */

class Intro extends StatefulWidget {
  const Intro({super.key});

    _IntroState createState() => _IntroState();

}

class _IntroState extends State<Intro> {
  bool _obscureText = true; 

  final String text = "Sign in ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50], 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Adds space between the text and the button


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100), 
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true, 
                  fillColor: Colors.grey[200], 
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16, 
                    horizontal: 16, 
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30), 
                    borderSide: BorderSide.none, 
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Padding(padding: const EdgeInsets.symmetric(horizontal: 200),
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                hintText: 'password',
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 5,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: const Color.fromARGB(255, 253, 171, 48))
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.accessibility_rounded),
                  onPressed:(){
                    setState(() {
                      _obscureText = !_obscureText;
                    });

                  } 

                
                ,)
              ),
            )
            ),

            SizedBox(height:29),



            TextButton(
              onPressed: () {
                // Add functionality here
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue, // Button background color
              ),
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
