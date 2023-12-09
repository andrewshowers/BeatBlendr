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
  List<String> genre_options = [
    'Classical',
    'Pop',
    'Jazz',
    'Hip Hop',
    'Country'
  ];
  String? selectedItem;

  // I was having a lot of trouble trying to make the dropdown default to null, but this fixed it
  @override
  void initState() {
    super
        .initState(); // this line is necessary, but I am slightly confused as to why.  Does not work without though.
    selectedItem = null; // Set selectedItem to null
  }

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
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Genre'),
              value: selectedItem,
              items: [
                DropdownMenuItem<String>(
                  child: Text(''), // Blank item
                  value: null,
                ),
                ...genre_options.map(
                  (item) => DropdownMenuItem<String>(
                    child: Text(item, style: TextStyle(fontSize: 20)),
                    value: item,
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedItem = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (selectedItem != null) {
                  // Create a new Song object from user input
                  Song newSong = Song(
                    title: titleController.text,
                    artist: artistController.text,
                    genre: selectedItem ?? 'DefaultGenre',
                  );

                  // Add the new song to the songs list
                  Song.addSong(newSong);

                  print(titleController.text);
                  print(artistController.text);
                  print(selectedItem);
                  setState(() {
        // Show the dialog with the song information
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Inserted Song'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Title: ${newSong.title}'),
                  Text('Artist: ${newSong.artist}'),
                  Text('Genre: ${newSong.genre ?? 'Unknown'}'),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );

        // Add the new song to the 'songs' list using the helper class
        Song.addSong(newSong);

        // Optionally, you can clear the text controllers
        titleController.clear();
        artistController.clear();
        selectedItem = null; // Reset the dropdown to null after submitting
      });
    } else {
      // Handle the case where the genre is not selected
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please select a genre.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  },
  child: Text('Insert Song'),
),
          ],
        ),
      ),
    );
  }
}
