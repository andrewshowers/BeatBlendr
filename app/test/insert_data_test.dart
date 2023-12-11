import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musicproject/insert_data_page.dart';
import 'package:musicproject/song.dart';

// This test makes sure that the insert button adds a song to the list. 
void main() {
  testWidgets('testing the insert song feature', (tester) async {
    //setup
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: InsertionPage()))); // this pumps the widget into the tester
    bool songFound = false;
    // do
    await tester.enterText(find.byType(TextField).first, 'test title'); // this finds the first text field and enters the text 'test title'
    await tester.enterText(find.byType(TextField).at(1), 'test artist'); // this finds the second text field and enters the text 'test artist'
    await tester.tap(find.byType(DropdownButtonFormField<String>)); // this finds the dropdown button and taps it
    await tester.pumpAndSettle(); // this finds the first item in the dropdown menu and taps it
    await tester.tap(find.text('Pop')); // finds the text 'Pop' and taps it
    await tester.pumpAndSettle(); // this waits for the animation to finish
    await tester.tap(find.byType(ElevatedButton)); // this finds the insert button and taps it
    // test
    List<Song> genreSongs =
        Song.songs.where((song) => song.genre.toLowerCase() == 'pop').toList();
    // test
    for (var song in genreSongs) {
      if (song.title == 'test title' && song.artist == 'test artist' && song.genre == 'Pop') {
        songFound = true;
      }
    }
    expect(songFound, isTrue);
  });
}
