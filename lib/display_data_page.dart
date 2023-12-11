// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'song.dart';

class DisplayDataPage extends StatelessWidget {
  DisplayDataPage({super.key});

  List<Song> _list = Song.songs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Song Library'),
      ),
      body: ListView.builder(
        // ListView is used to display a list of items
        itemCount: _list.length, // number of items to be displayed
        itemBuilder: (context, index) {
          // Access the currently indexed song
          Song currentSong = _list[index];
          return ListTile(
            title: Text(currentSong.title),
            subtitle: Text(
                'Artist: ${currentSong.artist} | Genre: ${currentSong.genre}'),
          );
        },
      ),
    );
  }
}
