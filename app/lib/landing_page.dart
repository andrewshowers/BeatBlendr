// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'display_data_page.dart';
import 'insert_data_page.dart';
import 'genre_buttons_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 108, 108, 108), // Grey background
      appBar: AppBar(
        title: Text(
          'BEAT BLENDR',
          style: TextStyle(
            color: Colors.orange, // Title text in blue
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GenreButtonsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.orange, // Set the button color to orange
                padding: EdgeInsets.symmetric(
                    horizontal: 100, vertical: 50), // Larger size
              ),
              child: Text(
                'Give me a song recomendation',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DisplayDataPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.orange, // Set the button color to orange
                padding: EdgeInsets.symmetric(
                    horizontal: 100, vertical: 50), // Larger size
              ),
              child: Text(
                'Song library',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InsertionPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.orange, // Set the button color to orange
                padding: EdgeInsets.symmetric(
                    horizontal: 100, vertical: 50), // Larger size
              ),
              child: Text(
                'Add a song to the library',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
