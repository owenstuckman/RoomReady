import 'package:flutter/material.dart';
import 'package:room_ready/GlobalStuff/local_data.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  // Controllers to store the entered values
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

            
            // Username TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: TextField(
                controller: usernameController, // Connect the controller to the text field
                decoration: InputDecoration(
                  hintText: 'Username',
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


            // Email TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: TextField(
                controller: emailController, // Connect the controller to the text field
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


            // Password TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: TextField(
                controller: passwordController, // Connect the controller to the text field
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
                    icon: Icon(
                      _obscureText ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText; // Toggle password visibility
                      });
                    },
                  ),
                ),
              ),
            ),


            SizedBox(height: 10),


            //Password text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Password must be 8 characters long"),
                ],
              ),
            ),



            SizedBox(height: 20),
            // Sign Up Button


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: TextButton(
                onPressed: () {
                  String username = usernameController.text;
                  String email = emailController.text;
                  String password = passwordController.text;

                 local_Data().saveProfileData(username,email,password,0,0,0);
                  
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
            ),


            //ending in case more stuff
          ],
        ),
      ),
    );
  }
}
