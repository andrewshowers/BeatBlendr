// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'display_data_page.dart';
import 'insert_data_page.dart';
import 'genre_buttons_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1), // white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Find Your', style: TextStyle(color: Colors.black87, fontSize: 25),),
                  SizedBox(height: 3),
                  // Text(
                  //   'Inspiration',
                  //   style: TextStyle(
                  //     color: Colors.black87,
                  //     fontSize: 40,
                  //   ),
                  // ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Hello world!',
                        textStyle: const TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      speed: const Duration(milliseconds: 2000),
                      ),
                    ],

                    totalRepeatCount: 4,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseSOnTap: true,
                ) 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
