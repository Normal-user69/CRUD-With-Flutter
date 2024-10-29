import 'package:facebook_clone/core/manger/user_manger.dart';
import 'package:facebook_clone/widgets/user.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "", pass = "";
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // App logo or title
              const Text(
                'Welcome To Fake FaceBook',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 40),
              // Email text field
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Password text field
              TextField(
                onChanged: (value) {
                  pass = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Login button
              ElevatedButton(
                onPressed: () {
                  // Handle login logic
                  UserManger().addUser(
                      User(id: UserManger.currentId, name: name, pass: pass));
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5.0,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 15),
              // Register and Forgot Password options
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigate to Register page
                    },
                    child: const Text(
                      'Q&A',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to Forgot Password page
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
