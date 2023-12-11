// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'song.dart';

/// DisplayDataPage is the page that displays the list of songs
/// We use ListView.builder to display the list of songs in an organized and efficient manner.
class DisplayDataPage extends StatelessWidget {
  DisplayDataPage({Key? key});

  // Made the list because it doesn't change
  final List<Song> _list = Song.songs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Song Library'),
      ),
      body: ListView.builder( // ListView is used to display a list of items
        itemCount: _list.length, // number of items to be displayed
        itemBuilder: (context, index) {
          Song song = _list[index]; // Access the currently indexed song
          return ListTile( // ListTile displays the row of information
            title: Text(song.title),
            subtitle: Text(
                'Artist: ${song.artist} | Genre: ${song.genre}'),
          );
        },
      ),
    );
  }
}
