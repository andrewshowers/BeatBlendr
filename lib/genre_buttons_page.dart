import 'package:flutter/material.dart';
import 'song.dart';

class GenreButtonsPage extends StatelessWidget {
  // Map of genres to image paths
  final Map<String, String> genreToImage = {
    'Hip-Hop': 'assets/images/Hip-Hop.jpg',
    'Pop': 'assets/images/Pop.jpg',
    'Jazz': 'assets/images/Jazz.jpg',
    'Classical': 'assets/images/Classical.jpg',
    'Country': 'assets/images/Country.jpg',
    // Add more genres and their corresponding images if needed
  };

  @override
  Widget build(BuildContext context) {
    // List of genres
    List<String> genres = ['Hip-Hop', 'Pop', 'Jazz', 'Classical', 'Country'];

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
    // Define the size of the square
    double size = MediaQuery.of(context).size.width / 2 -
        20; // Adjust the divisor to fit the layout

    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(10), // spacing between buttons
      child: ElevatedButton(
        // When the button is presses, we create a new list, convert the button genre and list genre to lowecase to make sure they're the same, and fill the list all the songs of that genre
        onPressed: () {
          Song? randomSong = Song.randomSongByGenre(Song.songs, genre);
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
                    // used text button instead of raised button because it looks nicer and is easier to implement
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          } else {
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
        child: Stack(
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
              child: Text(
                // Text under each button
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

  buildRandomButton(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          // When the button is presses, we create a new list, convert the button genre and list genre to lowecase to make sure they're the same, and fill the list all the songs of that genre
          onPressed: () {
            Song randomSong = Song.randomSong(Song.songs);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
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
                    // used text button instead of raised button because it looks nicer and is easier to implement
                    TextButton(
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
            backgroundColor: Colors.purple, // Set your desired color here
            foregroundColor: Colors.white, // This is the text color
            // Additional styling can be added here if needed
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
