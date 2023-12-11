import 'package:flutter/material.dart';
import 'song.dart';

/// GenreButtonsPage is the core of our application.
/// It displays a grid of buttons, each of which represents a genre, and return a dialog box containing a recommenended song
/// The 'I'm Feeling Lucky' button returns a dialog box containing a random song from any genre
/// This page uses methods from the Song class to generate the random songs, where the bulk of the logic and storage are
class GenreButtonsPage extends StatelessWidget {
  final Map<String, String> genreToImage = { // Map of genres to image paths
    'Hip-Hop': 'assets/images/Hip-Hop.jpg',
    'Pop': 'assets/images/Pop.jpg',
    'Jazz': 'assets/images/Jazz.jpg',
    'Classical': 'assets/images/Classical.jpg',
    'Country': 'assets/images/Country.jpg',
  };

  @override
  Widget build(BuildContext context) {
    List<String> genres = ['Hip-Hop', 'Pop', 'Jazz', 'Classical', 'Country']; // List of genres

    return Scaffold(
      appBar: AppBar(
        title: const Text('Genre Selection Page'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          childAspectRatio: 1.0, // Aspect ratio for each item
          crossAxisSpacing: 10, // Horizontal space between items
          mainAxisSpacing: 10, // Vertical space between items
        ),
        itemCount: genres.length + 1,
        itemBuilder: (context, index) {
          if (index < genres.length) {
            String genre = genres[index];
            String imagePath = genreToImage[genre] ?? 'default_image_path.jpg';
            return buildGenreButton(genre, imagePath, context);
          } else {
            return buildRandomButton(context);
          }
        },
      ),
    );
  }

  Widget buildGenreButton(
      String genre, String imagePath, BuildContext context) {
    double size = MediaQuery.of(context).size.width / 2 - // Define the size of the square
        20; // Adjust the divisor to fit the layout

    // When the button is presses, we create a new list, 
    // convert the button genre and list genre to lowecase to make sure they're the same, 
    // and fill the list all the songs of that genre
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(10), // spacing between buttons
      child: ElevatedButton(
        onPressed: () {
          Song? randomSong = Song.randomSongByGenre(Song.songs, genre); // uses the randomSongByGenre method from the Song class
          if (randomSong != null) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Random Song - $genre'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Title: ${randomSong.title}'),
                      Text('Artist: ${randomSong.artist}'),
                      Text('Genre: ${randomSong.genre}'),
                    ],
                  ),
                  actions: [
                    TextButton( // used text button instead of raised button because it looks nicer and is easier to implement
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          } else { // Handle the case where the genre is not selected
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('No songs available for $genre'),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: Colors.black, width: 4), // button border
          ),
        ),
        child: Stack( // Stack is used to display the image and text on top of each other
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: AssetImage(imagePath),
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 10,
              child: Text( // Text under each button
                genre,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // when the button is pressed, we call the randomSong method from the Song class
  // this method does not take a genre parameter, so it returns a random song from any genre
  // we then display the song info in a dialog box
  buildRandomButton(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Song randomSong = Song.randomSong(Song.songs); // calls the randomSong method from the Song class
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog( // displays the song info in a dialog box
                  title: const Text('Random Song'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Title: ${randomSong.title}'),
                      Text('Artist: ${randomSong.artist}'),
                      Text('Genre: ${randomSong.genre}'),
                    ],
                  ),
                  actions: [
                    TextButton( // used text button instead of raised button because it looks nicer and is easier to implement
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple, 
            foregroundColor: Colors.white, 
          ),
          child: const Text(
            'I\'m Feeling Lucky!',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }

  void main() {
    runApp(MaterialApp(
      home: GenreButtonsPage(),
    ));
  }
}
