import 'package:flutter/material.dart';
import 'landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // specify the theme for the app
      title: 'BeatBlendr', // title of the app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: LandingPage(), // specify the home page as LandingPage
    );
  }
}
