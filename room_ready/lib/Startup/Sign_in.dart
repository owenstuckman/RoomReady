import 'package:flutter/material.dart';
import 'package:room_ready/GlobalStuff/local_data.dart';
import 'package:room_ready/Startup/Sign_up.dart';
import 'package:room_ready/home_page.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _obscureText = true;

  // Create TextEditingControllers for email and password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final local_Data localDataInstance = local_Data(); // Instance of your local data class

  final String text = "Sign in now";

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


            
            // Email TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: TextField(
                controller: emailController, // Connect the controller
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
                controller: passwordController, // Connect the controller
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Forgot Password clicked');
                      // Handle forgot password
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(height: 20),


            
            // Sign In Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: TextButton(
                onPressed: () async {
                  String email = emailController.text;
                  String password = passwordController.text;

                  // Call the dataLogin method from local_Data instance
                  bool loginSuccess = await localDataInstance.dataLogin(email, password);

                  if (loginSuccess) {
                    print("Login successful");
                    Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
                  } else {
                    print("Login failed. Incorrect email or password.");
                    // Show error message or handle failed login
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),



            //reformat so only the word sign up is blue
                GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
              child: Text(
                "Don't have an account? Sign Up",
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
