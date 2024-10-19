import 'package:flutter/material.dart';



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



            SizedBox(height: 20),

            Text(
              'Please sign in to continue our app',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
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



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 253, 171, 48),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
            ),



            SizedBox(height: 10),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {

                      print('Forgot Password clicked');
                      //Do more shit later
                      
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),



            SizedBox(height: 20),

            TextButton(
              onPressed: () {
                // Do all the shit here
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue, 
              ),
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
