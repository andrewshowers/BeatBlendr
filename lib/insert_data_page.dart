import 'package:flutter/material.dart';
import 'song.dart';

class InsertionPage extends StatefulWidget {
  @override
  _InsertionPageState createState() => _InsertionPageState();
}

class _InsertionPageState extends State<InsertionPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController artistController = TextEditingController();
  TextEditingController genreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert a Song'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: artistController,
              decoration: InputDecoration(labelText: 'Artist'),
            ),
            TextField(
              controller: genreController,
              decoration: InputDecoration(labelText: 'Genre'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Create a new Song object from user input
                Song newSong = Song(
                  title: titleController.text,
                  artist: artistController.text,
                  genre: genreController.text,
                );

                // Add the new song to the 'songs' list using the helper class
                Song.addSong(newSong);

                // Optionally, you can clear the text controllers
                titleController.clear();
                artistController.clear();
                genreController.clear();
              },
              child: Text('Insert Song'),
            ),
          ],
        ),
      ),
    );
  }
}
