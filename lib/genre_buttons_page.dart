import 'package:flutter/material.dart';
import 'song.dart';

class GenreButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genre Selection Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // This is the easiest way to make the buttons "modular" so to speak. As opposed to creating a separate raised button for each, there is essentially a class called genrebutton that can be reused.
          buildGenreButton('Hip-Hop', context),
          buildGenreButton('Pop', context),
          buildGenreButton('Jazz', context),
          buildGenreButton('Classical', context),
          buildGenreButton('Country', context),
          buildRandomButton(context),
        ],
      ),
    );
  }

  Widget buildGenreButton(String genre, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue, // Button color
            onPrimary: Colors.white, // Text color
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
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
          child: Text(
            genre,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
  
  buildRandomButton(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue, // Button color
            onPrimary: Colors.white, // Text color
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
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
            }, child: const Text(
              'I\'m Feeling Lucky',
              style: TextStyle(fontSize: 18),
            ),
        )));
}

void main() {
  runApp(MaterialApp(
    home: GenreButtonsPage(),
  ));
}
}