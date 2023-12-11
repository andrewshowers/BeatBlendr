import 'package:flutter/material.dart';
import 'display_data_page.dart';
import 'insert_data_page.dart';
import 'genre_buttons_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1), // White background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            // Use Builder to get a context with Scaffold ancestor
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.black87),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer on menu icon tap
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Insert Data'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InsertionPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Display Data'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisplayDataPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Genre Selection'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GenreButtonsPage(),
                  ),
                );
              },
            ),
          ],
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
                  Text(
                    'Find Your',
                    style: TextStyle(color: Colors.black87, fontSize: 25),
                  ),
                  SizedBox(height: 3),
                  // Removed commented-out code. Uncomment if needed.
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
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
