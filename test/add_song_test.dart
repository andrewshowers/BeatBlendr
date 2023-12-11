import 'package:flutter_test/flutter_test.dart';
import 'package:musicproject/song.dart';

// this tests the addSong() method. It adds a song to an empty list of type song, and checks to make sure it was added.
void main() {
  test('testing the newSong() method', () {
    //setup
    List<Song> songList = [];
    Song newSong = Song(
      title: 'test title',
      artist: 'test artist',
      genre: 'test genre',
    );
    //do
    Song.addSong(newSong, songList);
    //test
    expect(songList.length, 1);
    expect(songList[0].title, 'test title');
    expect(songList[0].artist, 'test artist');
    expect(songList[0].genre, 'test genre');
  });
}
