import 'package:flutter/material.dart';

AppBar appBar(){
  return AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Row(
          children: [
            // Profile icon on the left
            CircleAvatar(
              // backgroundImage: AssetImage('assets/profile.jpg'), // Add your profile image here
              radius: 18,
            ),
            SizedBox(width: 10), // Spacing between icon and title
            Text("FaceBook Clone"),
          ],
        ),
      );
}