// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'display_data_page.dart';
import 'insert_data_page.dart';
import 'genre_buttons_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to our Flutter App!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InsertionPage()),
                );
              },
              child: Text('Go to Insertion Page'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DisplayDataPage()),
                );
              },
              child: Text('Go to Display Data Page'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GenreButtonsPage()),
                );
              },
              child: Text('Go to Genre Selection Page'),
            ),
          ],
        ),
      ),
    );
  }
}