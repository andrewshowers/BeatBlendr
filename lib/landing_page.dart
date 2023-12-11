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
                      TyperAnimatedText('Passion', textStyle: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,), speed: const Duration(milliseconds: 100),),
                      TyperAnimatedText('Music', textStyle: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,), speed: const Duration(milliseconds: 100),),
                      TyperAnimatedText('Jam', textStyle: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,), speed: const Duration(milliseconds: 100),),
                      TyperAnimatedText('Song', textStyle: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,), speed: const Duration(milliseconds: 100),),
                      TyperAnimatedText('Tune', textStyle: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,), speed: const Duration(milliseconds: 100),),
                      TyperAnimatedText('Rhythm', textStyle: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,), speed: const Duration(milliseconds: 100),),
                      TyperAnimatedText('Melody', textStyle: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,), speed: const Duration(milliseconds: 100),),
                      TyperAnimatedText('Genre', textStyle: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,), speed: const Duration(milliseconds: 100),),
                      TyperAnimatedText('Artist', textStyle: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,), speed: const Duration(milliseconds: 100),),
                      TyperAnimatedText('Beat', textStyle: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,), speed: const Duration(milliseconds: 100),),
                    ],

                    totalRepeatCount: 4,
                    // pause: const Duration(milliseconds: 100),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
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
