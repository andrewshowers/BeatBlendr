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
          padding: EdgeInsets.only(top: 25),
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
                    // totalRepeatCount: 4,
                    repeatForever: true,
                    displayFullTextOnTap: true,
                    // stopPauseOnTap: true,
                  ),
                  SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(244, 243, 243, 1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black87), // Add a border
                        image: DecorationImage(
                          image: AssetImage('assets/images/music.jpg'),
                          fit: BoxFit.cover,
                        )
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GenreButtonsPage(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.audiotrack,
                              color: Colors.black87,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Let's Go!",
                              style: TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Featured Artists',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          promoCard('assets/images/21savage.jpg'),
                          promoCard('assets/images/taylorswift.jpg'),
                          promoCard('assets/images/future.jpg'),
                          promoCard('assets/images/kanye.jpg'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/spotify.jpg')),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: [
                                0.3,
                                0.9
                              ],
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.2)
                              ]),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Explore on Spotify',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }

  Widget promoCard(image) {
    return AspectRatio(
      aspectRatio: 2.62 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                0.1,
                0.9
              ], colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.1)
              ])),
        ),
      ),
    );
  }
}