import 'package:flutter/material.dart';



class Signup extends StatefulWidget {
  const Signup({super.key});

  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true;

  final String text = "Sign up now";

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
                  ),
                ),
              ),
            ),


            SizedBox(height: 20),




            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'UserName',
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text(
                    "Password must be 8 character long"
                  )
                ],
              )
            ),



            SizedBox(height: 20),

            
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150), // Corrected EdgeInsets
              child: TextButton(
                onPressed: () {
                  // Add your action here
                  print("Sign In button pressed");
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white, // White text color for contrast
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
