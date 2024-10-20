import 'package:flutter/material.dart';
import 'package:room_ready/GlobalStuff/local_data.dart';
import 'package:room_ready/Startup/Sign_in.dart';
import 'package:room_ready/Startup/interests.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  final String text = "Sign up now";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 237, 219, 1),
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
                controller: usernameController, 
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


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: TextField(
                controller: emailController, 
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
                controller: passwordController, 
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
                  Text("Password must be 8 characters long"),
                ],
              ),
            ),



            SizedBox(height: 20),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: TextButton(
                onPressed: () {
                  String username = usernameController.text;
                  String email = emailController.text;
                  String password = passwordController.text;

                 local_Data().saveProfileData(username,email,password,0,0,0);

                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Interests()),
                );
                  
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue, 
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white, 
                  ),
                ),
              ),
            ),


             GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signin()),
                );
              },
              child: Text(
                "Already have an account? Sign in",
                style: TextStyle(
                  color: Colors.blue, 
                  fontSize: 16,
                  decoration: TextDecoration.underline, 
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
